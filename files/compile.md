## Compile Conky from sources
❗ Note that Conky **1.19.1_pre** have a bug which crashes application if it's config file was changed. So, make sure not using those version and **test compiled application before install**.

1. Install all necessary librarys:
```shell
sudo apt -y install \
   build-essential \
   libncurses5-dev \
   libncurses5w-dev \
   libxss-dev \
   libxxf86vm-dev \
   libxkbfile-dev \
   libxv-dev \
   libxdamage-dev \
   libfreetype6-dev \
   libxft-dev \
   libxinerama-dev \
   liblua5.4-dev \
   libimlib2-dev \
   libiw-dev
```
**libiw-dev** needs for **Wi-Fi** feature enabled only.
<br/>_Depending on your system config the list above can change._
2. Get sources from repository:
```shell
git clone https://github.com/brndnmtthws/conky.git
```
3. Goto **conky** directory and create **build** dir and goto into it
```shell
mkdir build && cd build
```
4. Run `cmake ../`
5. Chage `conky/build/CMakeCache.txt`  (line 138) with setting `BUILD_WLAN:BOOL=ON`
6. Add into `conky/cmake/ConkyPlatformChecks.cmake` (line 275, **WLAN section**)
```shell
set(IWLIB_H "/usr/include/iwlib.h")
```
7. Run 
```shell
cmake ../
```
(to apply changes). It may need to add something like this to cmake if it couldn't find freetype library:
```shell
cmake -DFREETYPE_INCLUDE_DIR_freetype2=/usr/include/freetype2 ../
```
8. Make application with command 
```shell
make
```
9. ❗ Test it!
```shell
conky -c <path_to_config_file>
```
10. Install application into system
```shell
sudo make install
```
11. Clean (ap to you)
```shell
make clean
```