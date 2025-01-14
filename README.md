# About This Project

The code on this branch is the outcome of a Master thesis project of the
Compiler Design Lab at Saarland University.

Based on LLVM release 12.0.1, we implemented an explorative approach to
the problem of finding the best vectorization and interleaving factor for
innermost loops.

Roughly, the tool works as follows:

- A pass is inserted immediately before LoopVectorize that retrieves all
  innermost loops from the function and copies each of them, to insert them
  into a new function in a new module
  
- For every possible combination of vectorization and interleaving factor
  within the ranges hard-coded in ExplorativeLV.cpp, the copied loop is
  annotated such that LoopVectorize is forced to choose the factors and runs
  through the compilation pipeline up until an assembly or object file would
  be generated
  
- A pass at the very end of the backend pipeline calculates a cost estimate
  for the generated machine code, which is used by the exploration pass to
  determine the best combination of factors
  
- Finally, the combination that has been selected is forced onto the original
  loop with annotations, such that the loop vectorizer will chose these
  factors.
  
The implementation adds the following hidden command line arguments to
enable and fine-tune compilation with the exploration tool:

- `enable-explorative-lv`: Set to true in order to activate the tool

- `explore-plain`: By default, the tool's cost calculation only takes into
  account machine code of blocks that are part of the loop, i.e., blocks
  whose names contain the strings "`vector.`", "`while.`" or "`for.`". Set
  this option to true if you want to base your result on the complete machine
  code output.
  
- `explore-divide-by-vf`: Enable this option in order to make the exploration
  pass divide the cost results by the vectorization factor when comparing
  them. This shadows LoopVectorize's behaviour when computing vectorization
  costs and increases the chance of higher factors being used.
  
- `explore-with-mca`: Set this argument to true in order to use `llvm-mca`
  for the machine code cost estimation instead of the machine instruction
  count. *Note: This only works on architectures for which llvm-mca is
  available and can analyse machine code that may contain control structures*

More information about the project as well as an evaluation on an embedded
Arm and an Intel© server architecture can be found here:
_Thesis link to follow soon_

_From here on follows the original README of the LLVM project_

# The LLVM Compiler Infrastructure

This directory and its sub-directories contain source code for LLVM,
a toolkit for the construction of highly optimized compilers,
optimizers, and run-time environments.

The README briefly describes how to get started with building LLVM.
For more information on how to contribute to the LLVM project, please
take a look at the
[Contributing to LLVM](https://llvm.org/docs/Contributing.html) guide.

## Getting Started with the LLVM System

Taken from https://llvm.org/docs/GettingStarted.html.

### Overview

Welcome to the LLVM project!

The LLVM project has multiple components. The core of the project is
itself called "LLVM". This contains all of the tools, libraries, and header
files needed to process intermediate representations and converts it into
object files.  Tools include an assembler, disassembler, bitcode analyzer, and
bitcode optimizer.  It also contains basic regression tests.

C-like languages use the [Clang](http://clang.llvm.org/) front end.  This
component compiles C, C++, Objective-C, and Objective-C++ code into LLVM bitcode
-- and from there into object files, using LLVM.

Other components include:
the [libc++ C++ standard library](https://libcxx.llvm.org),
the [LLD linker](https://lld.llvm.org), and more.

### Getting the Source Code and Building LLVM

The LLVM Getting Started documentation may be out of date.  The [Clang
Getting Started](http://clang.llvm.org/get_started.html) page might have more
accurate information.

This is an example work-flow and configuration to get and build the LLVM source:

1. Checkout LLVM (including related sub-projects like Clang):

     * ``git clone https://github.com/llvm/llvm-project.git``

     * Or, on windows, ``git clone --config core.autocrlf=false
    https://github.com/llvm/llvm-project.git``

2. Configure and build LLVM and Clang:

     * ``cd llvm-project``

     * ``mkdir build``

     * ``cd build``

     * ``cmake -G <generator> [options] ../llvm``

        Some common build system generators are:

        * ``Ninja`` --- for generating [Ninja](https://ninja-build.org)
          build files. Most llvm developers use Ninja.
        * ``Unix Makefiles`` --- for generating make-compatible parallel makefiles.
        * ``Visual Studio`` --- for generating Visual Studio projects and
          solutions.
        * ``Xcode`` --- for generating Xcode projects.

        Some Common options:

        * ``-DLLVM_ENABLE_PROJECTS='...'`` --- semicolon-separated list of the LLVM
          sub-projects you'd like to additionally build. Can include any of: clang,
          clang-tools-extra, libcxx, libcxxabi, libunwind, lldb, compiler-rt, lld,
          polly, or debuginfo-tests.

          For example, to build LLVM, Clang, libcxx, and libcxxabi, use
          ``-DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi"``.

        * ``-DCMAKE_INSTALL_PREFIX=directory`` --- Specify for *directory* the full
          path name of where you want the LLVM tools and libraries to be installed
          (default ``/usr/local``).

        * ``-DCMAKE_BUILD_TYPE=type`` --- Valid options for *type* are Debug,
          Release, RelWithDebInfo, and MinSizeRel. Default is Debug.

        * ``-DLLVM_ENABLE_ASSERTIONS=On`` --- Compile with assertion checks enabled
          (default is Yes for Debug builds, No for all other build types).

      * ``cmake --build . [-- [options] <target>]`` or your build system specified above
        directly.

        * The default target (i.e. ``ninja`` or ``make``) will build all of LLVM.

        * The ``check-all`` target (i.e. ``ninja check-all``) will run the
          regression tests to ensure everything is in working order.

        * CMake will generate targets for each tool and library, and most
          LLVM sub-projects generate their own ``check-<project>`` target.

        * Running a serial build will be **slow**.  To improve speed, try running a
          parallel build.  That's done by default in Ninja; for ``make``, use the option
          ``-j NNN``, where ``NNN`` is the number of parallel jobs, e.g. the number of
          CPUs you have.

      * For more information see [CMake](https://llvm.org/docs/CMake.html)

Consult the
[Getting Started with LLVM](https://llvm.org/docs/GettingStarted.html#getting-started-with-llvm)
page for detailed information on configuring and compiling LLVM. You can visit
[Directory Layout](https://llvm.org/docs/GettingStarted.html#directory-layout)
to learn about the layout of the source code tree.
