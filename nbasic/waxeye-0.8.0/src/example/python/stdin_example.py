# Waxeye Parser Generator
# www.waxeye.org
# Copyright (C) 2008-2010 Orlando Hill
# Licensed under the MIT license. See 'LICENSE' for details.

import sys
import parser

p = parser.Parser()
input = sys.stdin.read()
print p.parse(input)
