cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=/Applications/CLion.app/Contents/bin/ninja/mac/ninja -G Ninja -S /Users/joshuaji/code/skewl/cmput415/generator-joshuanianji -B /Users/joshuaji/code/skewl/cmput415/generator-joshuanianji/cmake-build-debug

docker run -it \
    -v "$(pwd)":/app test \
    bash -c "cd /demo && make"

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=ninja -G Ninja -S /app/generator-joshuanianji -B /app/generator-joshuanianji/cmake-build-debug

cmake --build /app/generator-joshuanianji/cmake-build-debug --target all -j 8