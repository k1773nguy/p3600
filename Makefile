all:

MKDIR  ?= mkdir -p
LUAJIT ?= luajit -O -bs
ZIP    ?= zip -9 -u -v

dirs  := $(patsubst src/%,p3600/%,$(shell find src -type d))
files := $(patsubst src/%,p3600/%,$(shell find src -name "*.lua"))

p3600/%.lua: src/%.lua directories
	$(LUAJIT) $< $@

directories:
	$(MKDIR) $(dirs)

all: $(files)

p3600.love: $(files)
	$(MAKE) -C p3600 -f ../Makefile ../p3600.love

../p3600.love:
	$(ZIP) ../p3600.love -r * -x .gitignore

.PHONY: all directories
