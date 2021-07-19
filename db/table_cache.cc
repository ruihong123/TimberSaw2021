// Copyright (c) 2011 The LevelDB Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file. See the AUTHORS file for names of contributors.

#include <utility>

#include "db/table_cache.h"

#include "db/filename.h"
#include "leveldb/env.h"
#include "leveldb/table.h"
#include "util/coding.h"

namespace leveldb {
#ifdef GETANALYSIS
std::atomic<uint64_t> TableCache::GetTimeElapseSum = 0;
std::atomic<uint64_t> TableCache::GetNum = 0;
std::atomic<uint64_t> TableCache::filtered = 0;
std::atomic<uint64_t> TableCache::not_filtered = 0;
std::atomic<uint64_t> TableCache::BinarySearchTimeElapseSum = 0;
std::atomic<uint64_t> TableCache::foundNum = 0;

#endif
struct TableAndFile {
//  RandomAccessFile* file;
//  std::weak_ptr<RemoteMemTableMetaData> remote_table;
  Table* table;
};

static void DeleteEntry(const Slice& key, void* value) {
  TableAndFile* tf = reinterpret_cast<TableAndFile*>(value);
  delete tf->table;
//  delete tf->file;
  delete tf;
}

static void UnrefEntry(void* arg1, void* arg2) {
  Cache* cache = reinterpret_cast<Cache*>(arg1);
  Cache::Handle* h = reinterpret_cast<Cache::Handle*>(arg2);
  cache->Release(h);
}

TableCache::TableCache(const std::string& dbname, const Options& options,
                       int entries)
    : env_(options.env),
      dbname_(dbname),
      options_(options),
      cache_(NewLRUCache(entries)) {}

TableCache::~TableCache() {
#ifdef GETANALYSIS
  if (TableCache::GetNum.load() >0 && TableCache::not_filtered.load() > 0)
    printf("Cache Get time statics is %zu, %zu, %zu, need binary search: "
           "%zu, filtered %zu, foundNum is %zu, average time elapse for binary search is %zu\n",
           TableCache::GetTimeElapseSum.load(), TableCache::GetNum.load(),
           TableCache::GetTimeElapseSum.load()/TableCache::GetNum.load(),
           TableCache::not_filtered.load(), TableCache::filtered.load(),
           TableCache::foundNum.load(), TableCache::BinarySearchTimeElapseSum.load()/TableCache::not_filtered.load());
#endif
  delete cache_;
}

Status TableCache::FindTable(
    std::shared_ptr<RemoteMemTableMetaData> Remote_memtable_meta,
    Cache::Handle** handle) {
  Status s;
  char buf[sizeof(Remote_memtable_meta->number)];
  EncodeFixed64(buf, Remote_memtable_meta->number);
  Slice key(buf, sizeof(buf));
  *handle = cache_->Lookup(key);
  if (*handle == nullptr) {
    Table* table = nullptr;

    if (s.ok()) {
      s = Table::Open(options_, &table, Remote_memtable_meta);
    }
    //TODO(ruihong): add remotememtablemeta and Table to the cache entry.
    if (!s.ok()) {
      assert(table == nullptr);
//      delete file;
      // We do not cache error results so that if the error is transient,
      // or somebody repairs the file, we recover automatically.
    } else {
      TableAndFile* tf = new TableAndFile;
//      tf->file = file;
//      tf->remote_table = Remote_memtable_meta;
      tf->table = table;
      assert(table->rep_ != nullptr);
      *handle = cache_->Insert(key, tf, 1, &DeleteEntry);
    }
  }
  return s;
}

Iterator* TableCache::NewIterator(
    const ReadOptions& options,
    std::shared_ptr<RemoteMemTableMetaData> remote_table, Table** tableptr) {
  if (tableptr != nullptr) {
    *tableptr = nullptr;
  }

  Cache::Handle* handle = nullptr;
  Status s = FindTable(std::move(remote_table), &handle);
  if (!s.ok()) {
    return NewErrorIterator(s);
  }

  Table* table = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->table;
  Iterator* result = table->NewIterator(options);
  result->RegisterCleanup(&UnrefEntry, cache_, handle);
  if (tableptr != nullptr) {
    *tableptr = table;
  }
  return result;
}

Status TableCache::Get(const ReadOptions& options,
                       std::shared_ptr<RemoteMemTableMetaData> f,
                       const Slice& k, void* arg,
                       void (*handle_result)(void*, const Slice&,
                                             const Slice&)) {
#ifdef GETANALYSIS
  auto start = std::chrono::high_resolution_clock::now();
#endif
  Cache::Handle* handle = nullptr;
  Status s = FindTable(f, &handle);
  if (s.ok()) {
    Table* t = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->table;
    s = t->InternalGet(options, k, arg, handle_result);
    cache_->Release(handle);
  }
#ifdef GETANALYSIS
  auto stop = std::chrono::high_resolution_clock::now();
  auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(stop - start);
//    std::printf("Get from SSTables (not found) time elapse is %zu\n",  duration.count());
  TableCache::GetTimeElapseSum.fetch_add(duration.count());
  TableCache::GetNum.fetch_add(1);
#endif
  return s;
}

void TableCache::Evict(uint64_t file_number) {
  char buf[sizeof(file_number)];
  EncodeFixed64(buf, file_number);
  cache_->Erase(Slice(buf, sizeof(buf)));
}

}  // namespace leveldb
