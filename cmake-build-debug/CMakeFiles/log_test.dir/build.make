# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/151/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/151/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ruihong/Projects/leveldb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ruihong/Projects/leveldb/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/log_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/log_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/log_test.dir/flags.make

CMakeFiles/log_test.dir/util/testutil.cc.o: CMakeFiles/log_test.dir/flags.make
CMakeFiles/log_test.dir/util/testutil.cc.o: ../util/testutil.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/log_test.dir/util/testutil.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/log_test.dir/util/testutil.cc.o -c /home/ruihong/Projects/leveldb/util/testutil.cc

CMakeFiles/log_test.dir/util/testutil.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log_test.dir/util/testutil.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ruihong/Projects/leveldb/util/testutil.cc > CMakeFiles/log_test.dir/util/testutil.cc.i

CMakeFiles/log_test.dir/util/testutil.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log_test.dir/util/testutil.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ruihong/Projects/leveldb/util/testutil.cc -o CMakeFiles/log_test.dir/util/testutil.cc.s

CMakeFiles/log_test.dir/db/log_test.cc.o: CMakeFiles/log_test.dir/flags.make
CMakeFiles/log_test.dir/db/log_test.cc.o: ../db/log_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/log_test.dir/db/log_test.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/log_test.dir/db/log_test.cc.o -c /home/ruihong/Projects/leveldb/db/log_test.cc

CMakeFiles/log_test.dir/db/log_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log_test.dir/db/log_test.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ruihong/Projects/leveldb/db/log_test.cc > CMakeFiles/log_test.dir/db/log_test.cc.i

CMakeFiles/log_test.dir/db/log_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log_test.dir/db/log_test.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ruihong/Projects/leveldb/db/log_test.cc -o CMakeFiles/log_test.dir/db/log_test.cc.s

# Object files for target log_test
log_test_OBJECTS = \
"CMakeFiles/log_test.dir/util/testutil.cc.o" \
"CMakeFiles/log_test.dir/db/log_test.cc.o"

# External object files for target log_test
log_test_EXTERNAL_OBJECTS =

log_test: CMakeFiles/log_test.dir/util/testutil.cc.o
log_test: CMakeFiles/log_test.dir/db/log_test.cc.o
log_test: CMakeFiles/log_test.dir/build.make
log_test: libleveldb.a
log_test: lib/libgmockd.a
log_test: lib/libgtestd.a
log_test: third_party/benchmark/src/libbenchmark.a
log_test: /usr/lib/x86_64-linux-gnu/libibverbs.so
log_test: /usr/lib/x86_64-linux-gnu/librt.so
log_test: CMakeFiles/log_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable log_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/log_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/log_test.dir/build: log_test

.PHONY : CMakeFiles/log_test.dir/build

CMakeFiles/log_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/log_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/log_test.dir/clean

CMakeFiles/log_test.dir/depend:
	cd /home/ruihong/Projects/leveldb/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruihong/Projects/leveldb /home/ruihong/Projects/leveldb /home/ruihong/Projects/leveldb/cmake-build-debug /home/ruihong/Projects/leveldb/cmake-build-debug /home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles/log_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/log_test.dir/depend

