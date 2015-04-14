########################################
############ libargp.a #################
########################################

LOCAL_PATH := $(call my-dir)

LIBARGP_SRC_FILES := \
	mempcpy.c strchrnul.c \
        argp-ba.c argp-eexst.c \
        argp-fmtstream.c argp-help.c \
        argp-parse.c argp-pv.c argp-pvh.c

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(LIBARGP_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=gnu99

LOCAL_MODULE:= libargp

include $(BUILD_STATIC_LIBRARY)
