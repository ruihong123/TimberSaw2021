# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /snap/clion/163/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/163/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ruihong/Projects/leveldb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ruihong/Projects/leveldb/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/filename_test.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/filename_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/filename_test.dir/flags.make

CMakeFiles/filename_test.dir/util/testutil.cc.o: CMakeFiles/filename_test.dir/flags.make
CMakeFiles/filename_test.dir/util/testutil.cc.o: ../util/testutil.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/filename_test.dir/util/testutil.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/filename_test.dir/util/testutil.cc.o -c /home/ruihong/Projects/leveldb/util/testutil.cc

CMakeFiles/filename_test.dir/util/testutil.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/filename_test.dir/util/testutil.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ruihong/Projects/leveldb/util/testutil.cc > CMakeFiles/filename_test.dir/util/testutil.cc.i

CMakeFiles/filename_test.dir/util/testutil.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/filename_test.dir/util/testutil.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ruihong/Projects/leveldb/util/testutil.cc -o CMakeFiles/filename_test.dir/util/testutil.cc.s

CMakeFiles/filename_test.dir/db/filename_test.cc.o: CMakeFiles/filename_test.dir/flags.make
CMakeFiles/filename_test.dir/db/filename_test.cc.o: ../db/filename_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/filename_test.dir/db/filename_test.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/filename_test.dir/db/filename_test.cc.o -c /home/ruihong/Projects/leveldb/db/filename_test.cc

CMakeFiles/filename_test.dir/db/filename_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/filename_test.dir/db/filename_test.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ruihong/Projects/leveldb/db/filename_test.cc > CMakeFiles/filename_test.dir/db/filename_test.cc.i

CMakeFiles/filename_test.dir/db/filename_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/filename_test.dir/db/filename_test.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ruihong/Projects/leveldb/db/filename_test.cc -o CMakeFiles/filename_test.dir/db/filename_test.cc.s

# Object files for target filename_test
filename_test_OBJECTS = \
"CMakeFiles/filename_test.dir/util/testutil.cc.o" \
"CMakeFiles/filename_test.dir/db/filename_test.cc.o"

# External object files for target filename_test
filename_test_EXTERNAL_OBJECTS =

filename_test: CMakeFiles/filename_test.dir/util/testutil.cc.o
filename_test: CMakeFiles/filename_test.dir/db/filename_test.cc.o
filename_test: CMakeFiles/filename_test.dir/build.make
filename_test: libleveldb.a
filename_test: lib/libgmockd.a
filename_test: lib/libgtestd.a
filename_test: third_party/benchmark/src/libbenchmark.a
filename_test: /usr/lib/x86_64-linux-gnu/libibverbs.so
filename_test: /usr/lib/x86_64-linux-gnu/librt.so
filename_test: CMakeFiles/filename_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable filename_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/filename_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/filename_test.dir/build: filename_test
.PHONY : CMakeFiles/filename_test.dir/build

CMakeFiles/filename_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/filename_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/filename_test.dir/clean

CMakeFiles/filename_test.dir/depend:
	cd /home/ruihong/Projects/leveldb/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruihong/Projects/leveldb /home/ruihong/Projects/leveldb /home/ruihong/Projects/leveldb/cmake-build-debug /home/ruihong/Projects/leveldb/cmake-build-debug /home/ruihong/Projects/leveldb/cmake-build-debug/CMakeFiles/filename_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/filename_test.dir/depend

