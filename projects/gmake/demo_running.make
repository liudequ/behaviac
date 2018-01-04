# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debugstatic32
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debugstatic32)
  OBJDIR     = ../../intermediate/debugstatic/gmake/demo_running/x32
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/demo_running_debugstatic_win32_gmake.exe
  DEFINES   += -DWIN32 -D_DEBUG -DDEBUG
  INCLUDES  += -I../../inc -I../../inc -I../include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -Wall -Wextra -ffast-math -m32 -Wno-invalid-offsetof -Wno-array-bounds -Wno-unused-local-typedefs -Wno-maybe-uninitialized -finput-charset=UTF-8
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../lib -m32 -L/usr/lib32
  LDDEPS    += ../../lib/libbehaviac_debugstatic_win32_gmake.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),releasestatic32)
  OBJDIR     = ../../intermediate/releasestatic/gmake/demo_running/x32
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/demo_running_releasestatic_win32_gmake.exe
  DEFINES   += -DWIN32 -DNDEBUG -D_CONSOLE
  INCLUDES  += -I../../inc -I../../inc -I../include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -Wall -Wextra -ffast-math -m32 /Ox /Oi /Ob1 /Ot -Wno-invalid-offsetof -Wno-array-bounds -Wno-unused-local-typedefs -Wno-maybe-uninitialized -finput-charset=UTF-8
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../lib -s -m32 -L/usr/lib32
  LDDEPS    += ../../lib/libbehaviac_releasestatic_win32_gmake.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/BTPlayer.o \
	$(OBJDIR)/demo_running.o \
	$(OBJDIR)/behaviac_generated_behaviors.o \
	$(OBJDIR)/behaviac_agent_meta.o \
	$(OBJDIR)/behaviac_customized_types.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking demo_running
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning demo_running
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
.NOTPARALLEL: $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/BTPlayer.o: ../../test/demo_running/BTPlayer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/demo_running.o: ../../test/demo_running/demo_running.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/behaviac_generated_behaviors.o: ../../test/demo_running/behaviac/exported/behaviac_generated/behaviors/behaviac_generated_behaviors.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/behaviac_agent_meta.o: ../../test/demo_running/behaviac/exported/behaviac_generated/types/internal/behaviac_agent_meta.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/behaviac_customized_types.o: ../../test/demo_running/behaviac/exported/behaviac_generated/types/internal/behaviac_customized_types.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
