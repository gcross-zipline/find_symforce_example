## CMake example of finding symforce package

```
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=<prefix used when installing symforce>
make
```

The `CMAKE_INSTALL_PREFIX` should match the prefix you used when symforce was installed with `make install`.

`symforce` will install `fmt` and `spdlog` for you by default.