ARG BASE_IMG
FROM $BASE_IMG

WORKDIR /root 
RUN git clone --depth 1 --branch llvmorg-16.0.6 https://github.com/llvm/llvm-project.git

# we need python to build llvm
RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get clean

WORKDIR /root/llvm-project/build
RUN cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="Native" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON
RUN ninja check-all -j4

ENV MLIR_INS="/root/llvm-project/build/"
ENV MLIR_DIR="$MLIR_INS/lib/cmake/mlir/"
ENV PATH="$MLIR_INS/bin:$PATH"