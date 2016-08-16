all:

MKDIR ?= mkdir -p
CP    ?= ln -f
ZIP   ?= zip -9 -u -v

dirs  := $(patsubst src/%,p3600/%,$(shell find src -type d))
files := $(patsubst src/%,p3600/%,$(shell find src -name "*.lua"))

p3600/%.lua: src/%.lua directories
	$(CP) $< $@

directories:
	$(MKDIR) $(dirs)

all: $(files)

p3600.love: p3600.zip
	$(CP) p3600.zip p3600.love

p3600.zip: $(files)
	$(MAKE) -C p3600 -f ../Makefile ../p3600.zip

../p3600.zip:
	$(ZIP) ../p3600.zip -r * -x .gitignore

.PHONY: all directories
