# C415 Docker

Docker image(s) for CMPUT 415, primarily for Github Actions

## Usage

TODO: does this actually work?

## Included Software

The Docker image should have everything on the [Ubuntu Setup docs](https://cmput415.github.io/415-docs/setup/ubuntu.html#installing-clion), **except for** CLion and MLIR. 

- libUUID, cmake, OpenJDK JRE 17
- ANTLR4 C++ Runtime
- ANTLR Generator
- [C415 Tester Utility](https://github.com/cmput415/Tester)

## Building Locally

The image on Github Container Registry is only built for x86 architecture (support for ARM might be planned). To build it youself, run the following on your own computer:

```bash
docker build -t c415-docker .
```

Now, the image should be available with `docker image ls`. 

Run `docker run -it -v "$(pwd)":/app c415-docker` to create a running container from the image with a volume mapping your current directory to the container's `/app` folder.