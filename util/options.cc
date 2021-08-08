// Copyright (c) 2011 The LevelDB Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file. See the AUTHORS file for names of contributors.

#include "leveldb/options.h"

#include "leveldb/comparator.h"
#include "leveldb/env.h"

namespace leveldb {

Options::Options() : comparator(BytewiseComparator()), env(Env::Default()) {

  env->rdma_mg->Mempool_initialize(std::string("DataBlock"), block_size);
  env->rdma_mg->Mempool_initialize(std::string("DataIndexBlock"),
                                   RDMA_WRITE_BLOCK);
  env->rdma_mg->Mempool_initialize(std::string("FilterBlock"),
                                   RDMA_WRITE_BLOCK);
  env->rdma_mg->Mempool_initialize(std::string("FlushBuffer"),
                                   RDMA_WRITE_BLOCK);
  env->SetBackgroundThreads(max_background_flushes,ThreadPoolType::FlushThreadPool);
  env->SetBackgroundThreads(max_background_compactions,ThreadPoolType::CompactionThreadPool);
}

}  // namespace leveldb
