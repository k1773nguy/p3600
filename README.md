p3600
=====

It's a game.


Running
-------

The engine was originally going to be written from scratch, but then I
found [LÖVE](https://love2d.org).

Since LÖVE is exactly what the original engine was going to be, but in
C++, it is used instead of reinventing the wheel.


Building
--------

Remember to run `git submodule update`. :wink:

### Recommended Method
Run `make p3600.love`.

### If You Want A Directory Instead
Run `make`.

### If You Don't Want The Files Compiled (for development, etc.)
You can run `make LUAJIT=cp` to copy the lua files instead of compiling them.
Compiling the files is recommended because the output is smaller.


What's With The Name?
---------------------

Everything else was taken?
If someone thinks of a better name, let us know.
