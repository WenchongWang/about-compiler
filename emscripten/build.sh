git clone --recursive https://gitee.com/yejinlei-mirror/emscripten-core-emscripten-fastcomp emscripten-fastcomp
cd emscripten-fastcomp
git clone --recursive https://gitee.com/yejinlei-mirror/emscripten-core-emscripten-fastcomp-clang tools/clang
mkdir build && cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release \
	-DLLVM_TARGETS_TO_BUILD="X86;JSBackend" \
	-DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF \
	-DCLANG_INCLUDE_TESTS=OFF
