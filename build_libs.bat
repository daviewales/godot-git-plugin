git submodule init
git submodule update --init --recursive

cd godot-git-plugin\thirdparty\libgit2\
mkdir build
cd build\
del /F CMakeCache.txt
cmake .. -DBUILD_SHARED_LIBS=OFF -DBUILD_CLAR=OFF -DBUILD_EXAMPLES=OFF -DUSE_SSH=ON -DUSE_HTTPS=ON -DUSE_BUNDLED_ZLIB=ON -DREGEX_BACKEND=builtin
cmake --build .
cd ../../../../
copy godot-git-plugin\thirdparty\libgit2\build\%1\git2.lib demo\bin\win64\

cd godot-cpp\
if defined CI set SCONS=..\scons.bat else set SCONS=scons
%SCONS% platform=windows target=%1 generate_bindings=yes bits=64
cd ..
