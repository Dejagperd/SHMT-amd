# Adjust paths for AMD GPU drivers on Ubuntu
GLPATH := /usr/lib/x86_64-linux-gnu
GLLINK := -L/usr/lib/x86_64-linux-gnu

# find libGL, libGLU 
GLLIB  := $(shell find -L $(GLPATH) -name libGL.so  -print 2>/dev/null)
GLULIB := $(shell find -L $(GLPATH) -name libGLU.so -print 2>/dev/null)

ifeq ("$(GLLIB)","")
    $(info >>> WARNING - libGL.so not found, refer to CUDA Getting Started Guide for how to find and install them. <<<)
    SAMPLE_ENABLED := 0
endif
ifeq ("$(GLULIB)","")
    $(info >>> WARNING - libGLU.so not found, refer to CUDA Getting Started Guide for how to find and install them. <<<)
    SAMPLE_ENABLED := 0
endif

HEADER_SEARCH_PATH ?= /usr/include
GLHEADER  := $(shell find -L $(HEADER_SEARCH_PATH) -name gl.h -print 2>/dev/null)
GLUHEADER := $(shell find -L $(HEADER_SEARCH_PATH) -name glu.h -print 2>/dev/null)

ifeq ("$(GLHEADER)","")
    $(info >>> WARNING - gl.h not found, refer to CUDA Getting Started Guide for how to find and install them. <<<)
    SAMPLE_ENABLED := 0
endif
ifeq ("$(GLUHEADER)","")
    $(info >>> WARNING - glu.h not found, refer to CUDA Getting Started Guide for how to find and install them. <<<)
    SAMPLE_ENABLED := 0
endif
