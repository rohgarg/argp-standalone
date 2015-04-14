JNI_ROOT := $(shell pwd)
NDK_ROOT ?= $(JNI_ROOT)/../android-ndk-r10d
SYS_ROOT := $(NDK_ROOT)/platforms/android-21/arch-arm/
DEBUG ?= 1
CONFIG_FILE := $(JNI_ROOT)/jni/config.h

CHMOD := chmod +x
CHDIR := cd

default: build

$(CONFIG_FILE):
	$(CHDIR) jni/ && ./configure --host=arm-linux-androideabi CFLAGS="--sysroot=$(SYS_ROOT)" CC="arm-linux-androideabi-gcc" CPPFLAGS="--sysroot=$(SYS_ROOT)" CPP="arm-linux-androideabi-cpp"

build: $(CONFIG_FILE)
	$(NDK_ROOT)/ndk-build V=1 NDK_DEBUG=$(DEBUG)

quiet:
	$(NDK_ROOT)/ndk-build NDK_DEBUG=$(DEBUG)

clean:
	$(CHDIR) jni/ && make distclean
	rm -rf obj/ libs/
