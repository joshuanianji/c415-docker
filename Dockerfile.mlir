ARG BASE_IMG
FROM $BASE_IMG

WORKDIR /root 
RUN git clone --depth 1 --branch llvmorg-16.0.6 https://github.com/llvm/llvm-project.git

# we need python to build llvm
RUN apt-get update && \
    apt-get install python3 clang lld -y && \
    apt-get clean

WORKDIR /root/llvm-project/build
RUN cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="Native" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_LLD=ON
RUN ninja check-all

ENV MLIR_INS="/root/llvm-project/build/"
ENV MLIR_DIR="$MLIR_INS/lib/cmake/mlir/"
ENV PATH="$MLIR_INS/bin:$PATH"
