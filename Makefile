# TARGETS
###############################################################################
# define "all" at the top so it is the default goal

# Make the basic, unpacked version
all:

# Make a .love file
p3600.love:


# BUILD OPTIONS
###############################################################################

# Copy $1 to $2
CP ?= cp

# Create a directory ($1), do nothing if it already exists
MKDIR ?= mkdir -p

# Copy a Lua file
# Can be set to `$(CP)` if you don't feel like compiling
LUAJIT ?= luajit -O -bs

# The "zip" utility
ZIP ?= zip -9 -u -v

###############################################################################


files := $(patsubst src/%,p3600/%,$(shell find src -name "*.lua"))
files += $(patsubst src/%,p3600/%,$(shell find src -name "*.glsl"))
files += $(patsubst src/%,p3600/%,$(shell find src -name "*.png"))
dirs := $(patsubst src/%,p3600/%,$(shell find src -type d))

# Engine
files += $(patsubst libs/engine/engine/%,p3600/%,$(shell find libs/engine/engine -name "*.lua"))
files += $(patsubst libs/engine/engine/%,p3600/%,$(shell find libs/engine/engine -name "*.png"))
dirs += $(patsubst libs/engine/engine/%,p3600/%,$(shell find libs/engine/engine -type d))

files := $(sort $(files))
dirs := $(sort $(dirs))


.SECONDEXPANSION:


# never compile conf.lua
p3600/conf.lua: src/conf.lua p3600
	$(CP) src/conf.lua p3600/conf.lua

p3600/%.lua: src/%.lua $$(@D)
	$(LUAJIT) $< $@

p3600/%.glsl: src/%.glsl $$(@D)
	$(CP) $< $@

p3600/%.png: src/%.png $$(@D)
	$(CP) $< $@


# Engine
# Defined after the "src/" recipes so that this project can "override"
# certain files.
p3600/%.lua: libs/engine/engine/%.lua $$(@D)
	$(LUAJIT) $< $@

p3600/%.png: libs/engine/engine/%.png $$(@D)
	$(CP) $< $@


$(dirs): $$(@D)
	$(MKDIR) $@

p3600:
	$(MKDIR) p3600

all: $(files)

.ONESHELL:
p3600.love: $(files)
	cd p3600
	$(ZIP) ../p3600.love -R

.PHONY: all
