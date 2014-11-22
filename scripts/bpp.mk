################################################################################
# Copyright (c) 2013-2014, Julien Bigot - CEA (julien.bigot@cea.fr)
# All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
################################################################################

BPP_COMPILER_ID:=Gnu

BPP_PATH:=$(abspath $(lastword $(MAKEFILE_LIST))/../..)
BPP=$(BPP_PATH)/scripts/bpp
BPP_DEFAULT_INCLUDES=-I $(BPP_PATH)/include

%: %.bpp
	$(BPP) $(BPP_DEFAULT_INCLUDES) -DBPP_CONFIG=config.$(BPP_COMPILER_ID) $(BPPOPTS) $< $@

%.F90: %.F90.bpp
	$(BPP) $(BPP_DEFAULT_INCLUDES) -DBPP_CONFIG=config.$(BPP_COMPILER_ID) $(BPPOPTS) $< $@

%.h: %.h.bpp
	$(BPP) $(BPP_DEFAULT_INCLUDES) -DBPP_CONFIG=config.$(BPP_COMPILER_ID) $(BPPOPTS) $< $@

%.inc: %.inc.bpp
	$(BPP) $(BPP_DEFAULT_INCLUDES) -DBPP_CONFIG=config.$(BPP_COMPILER_ID) $(BPPOPTS) $< $@
