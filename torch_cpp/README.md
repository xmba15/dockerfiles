## :running: How to Run

---

```bash
docker build -f ./dockerfiles/ubuntu2004.dockerfile -t torch_cpp .

# gpu
docker build -f ./dockerfiles/ubuntu2004_gpu.dockerfile -t torch_cpp_gpu .
```

- Use [libtorch](https://pytorch.org/) with CMake:

pass _/path/to/libtorch_ to _CMAKE_PREFIX_PATH_

```cmake
    set(LIBTORCH_DIR "/opt/libtorch")
    list(APPEND CMAKE_PREFIX_PATH ${LIBTORCH_DIR})
    find_package(Torch REQUIRED)
```
