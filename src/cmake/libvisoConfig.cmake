set(libviso_LIBRARIES_DIR /home/ryan/git/libviso2/build/)
set(libviso_LIBS viso2 png)
set(libviso_INCLUDE_DIRS /home/ryan/git/libviso2/src/)
FILE(GLOB libviso_SRC_FILES "${libviso_INCLUDE_DIRS}/*.cpp")
list(REMOVE_ITEM libviso_SRC_FILES "${libviso_INCLUDE_DIRS}/demo.cpp")


