// Copyright (c) 2011 The TimberSaw Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file. See the AUTHORS file for names of contributors.

#ifndef STORAGE_TimberSaw_INCLUDE_OPTIONS_H_
#define STORAGE_TimberSaw_INCLUDE_OPTIONS_H_

#include <cstddef>

#include "TimberSaw/export.h"
#include "table/format.h"

namespace TimberSaw {

class Cache;
class Comparator;
class Env;
class FilterPolicy;
class Logger;
class Snapshot;
// The size for one SStable chunk
//static size_t RDMA_WRITE_BLOCK = 2*1024*1024;
#define RDMA_WRITE_BLOCK  (8*1024*1024)
#define INDEX_BLOCK  (8*1024*1024)
#define FILTER_BLOCK  (1*1024*1024)
//static size_t RDMA_WRITE_BLOCK = 1*1024*1024;
// DB contents are stored in a set of blocks, each of which holds a
// sequence of key,value pairs.  Each block may be compressed before
// being stored in a file.  The following enum describes which
// compression method (if any) is used to compress a block.
const int kNumNonTableCacheFiles = 10;
// Fix user-supplied options to be reasonable
template <class T, class V>
static void ClipToRange(T* ptr, V minvalue, V maxvalue) {
  if (static_cast<V>(*ptr) > maxvalue) *ptr = maxvalue;
  if (static_cast<V>(*ptr) < minvalue) *ptr = minvalue;
}
// check if this structure is correct.
struct cmpBySlice {
  bool operator()(const Slice& a, const Slice& b) const {
    return a.compare(b) < 0;
  }
};
enum CompressionType {
  // NOTE: do not change the values of existing entries, as these are
  // part of the persistent format on disk.
  kNoCompression = 0x0,
  kSnappyCompression = 0x1
};

// Options to control the behavior of a database (passed to DB::Open)
// The options now do not support dynamically change.
struct TimberSaw_EXPORT Options {
  // Create an Options object with default values for all fields.
  Options();
  Options(bool is_memory_side);

  // -------------------
  // Parameters that affect behavior

  // Comparator used to define the order of keys in the table.
  // Default: a comparator that uses lexicographic byte-wise ordering
  //
  // REQUIRES: The client must ensure that the comparator supplied
  // here has the same name and orders keys *exactly* the same as the
  // comparator provided to previous open calls on the same DB.
  const Comparator* comparator;

  int max_background_flushes = 8;// 1-1 setup is 4 M-M setup is 8



  int max_background_compactions = 12;//
  int MaxSubcompaction = 12; // 1-1 setup is 12; M-M  should decrease with the number of shard.
  bool usesubcompaction = true;
  // If true, the database will be created if it is missing.
  bool create_if_missing = true;

  // If true, an error is raised if the database already exists.
  bool error_if_exists = false;

  // If true, the implementation will do aggressive checking of the
  // data it is processing and will stop early if it detects any
  // errors.  This may have unforeseen ramifications: for example, a
  // corruption of one DB entry may cause a large number of entries to
  // become unreadable or for the entire DB to become unopenable.
  bool paranoid_checks = false;

  // Use the specified object to interact with the environment,
  // e.g. to read/write files, schedule background work, etc.
  // Default: Env::Default()
  Env* env;

  // Any internal progress/error information generated by the db will
  // be written to info_log if it is non-null, or to a file stored
  // in the same directory as the DB contents if info_log is null.
  Logger* info_log = nullptr;

  // -------------------
  // Parameters that affect performance

  // Amount of data to build up in memory (backed by an unsorted log
  // on disk) before converting to a sorted on-disk file.
  //
  // Larger values increase performance, especially during bulk loads.
  // Up to two write buffers may be held in memory at the same time,
  // so you may wish to adjust this parameter to control memory usage.
  // Also, a larger write buffer will result in a longer recovery time
  // the next time the database is opened.
  size_t write_buffer_size = 64 * 1024 * 1024;

  // Number of open files that can be used by the DB.  You may need to
  // increase this if your database has a large working set (budget
  // one open file per 2MB of working set).
  int max_open_files = 5000;

  // Control over blocks (user data is stored in a set of blocks, and
  // a block is the unit of reading from disk).

  // If non-null, use the specified table_cache for blocks.
  // If null, TimberSaw will automatically create and use an 64MB internal table_cache.
  Cache* block_cache = nullptr;

  // Approximate size of user data packed per block.  Note that the
  // block size specified here corresponds to uncompressed data.  The
  // actual size of the unit read from disk may be smaller if
  // compression is enabled.  This parameter can be changed dynamically.
  //This value have to be hardcoded for 8k, because the RDMA mempool will
  // be initialized by this value
  size_t block_size = 8 * 1024;

  // Number of keys between restart points for delta encoding of keys.
  // This parameter can be changed dynamically.  Most clients should
  // leave this parameter alone.
  int block_restart_interval = 1;

  // TimberSaw will write up to this amount of bytes to a file before
  // switching to a new one.
  // Most clients should leave this parameter alone.  However if your
  // filesystem is more efficient with larger files, you could
  // consider increasing the value.  The downside will be longer
  // compactions and hence longer latency/performance hiccups.
  // Another reason to increase this parameter might be when you are
  // initially populating a large database.
  size_t max_file_size = 64 * 1024 * 1024;

  // Compress blocks using the specified compression algorithm.  This
  // parameter can be changed dynamically.
  //
  // Default: kSnappyCompression, which gives lightweight but fast
  // compression.
  //
  // Typical speeds of kSnappyCompression on an Intel(R) Core(TM)2 2.4GHz:
  //    ~200-500MB/s compression
  //    ~400-800MB/s decompression
  // Note that these speeds are significantly faster than most
  // persistent storage speeds, and therefore it is typically never
  // worth switching to kNoCompression.  Even if the input data is
  // incompressible, the kSnappyCompression implementation will
  // efficiently detect that and will switch to uncompressed mode.
  CompressionType compression = kNoCompression;

  // EXPERIMENTAL: If true, append to existing MANIFEST and log files
  // when a database is opened.  This can significantly speed up open.
  //
  // Default: currently false, but may become true later.
  bool reuse_logs = false;

  bool near_data_compaction = true;
  // If non-null, use the specified filter policy to reduce disk reads.
  // Many applications will benefit from passing the result of
  // NewBloomFilterPolicy() here.
  const FilterPolicy* filter_policy = nullptr;
  int bloom_bits = 10;

  std::vector<std::pair<Slice,Slice>>* ShardInfo = nullptr;// [Lower bound, upper bound)
};

// Options that control read operations
struct TimberSaw_EXPORT ReadOptions {
  ReadOptions() = default;

  // If true, all data read from underlying storage will be
  // verified against corresponding checksums.
  bool verify_checksums = true;

  // Should the data read for this iteration be cached in memory?
  // Callers may wish to set this field to false for bulk scans.
  bool fill_cache = true;

  // If "snapshot" is non-null, read as of the supplied snapshot
  // (which must belong to the DB that is being read and which must
  // not have been released).  If "snapshot" is null, use an implicit
  // snapshot of the state at the beginning of this read operation.
  const Snapshot* snapshot = nullptr;
};


// Options that control write operations
struct TimberSaw_EXPORT WriteOptions {
  WriteOptions() = default;

  // If true, the write will be flushed from the operating system
  // buffer table_cache (by calling WritableFile::Sync()) before the write
  // is considered complete.  If this flag is true, writes will be
  // slower.
  //
  // If this flag is false, and the machine crashes, some recent
  // writes may be lost.  Note that if it is just the process that
  // crashes (i.e., the machine does not reboot), no writes will be
  // lost even if sync==false.
  //
  // In other words, a DB write with sync==false has similar
  // crash semantics as the "write()" system call.  A DB write
  // with sync==true has similar crash semantics to a "write()"
  // system call followed by "fsync()".
  bool sync = false;
};

}  // namespace TimberSaw

#endif  // STORAGE_TimberSaw_INCLUDE_OPTIONS_H_
