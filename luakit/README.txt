LuaKit is a lua binary which can be coupled with a zip file (or other physfs-compatible archives) to distribute a script file with modules and dependencies as a single binary.

LuaKit was inspired by TclKit and Love2d (which uses the same method), and uses code from the Scrupp project (http://scrupp.sourceforge.net/).

To fuse the exe with an archive:
	Windows:  copy /b luakit.exe+archive.zip my.exe
	Bash (mingw or linux/unix):  cat luakit.exe archive.zip >> my.exe

depends on:
* Physfs (https://icculus.org/physfs/)
* Lua (https://lua.org)


Lua: Copyright © 1994–2013 Lua.org, PUC-Rio.
Scrupp: Copyright (c) 2005-2009 Andreas Krinke
Physfs: Copyright (c) 2001-2011 Ryan C. Gordon and others


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

