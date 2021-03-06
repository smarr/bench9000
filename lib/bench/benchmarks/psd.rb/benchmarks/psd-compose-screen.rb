# Copyright (c) 2014 Oracle and/or its affiliates. All rights reserved. This
# code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
# 
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

require "mock-logger"

require "psd/renderer/compose"

if defined? NATIVE
  require "oily_png/oily_png"
  require "psd_native/psd_native"
else
  require "chunky_png/color"
  require "psd/renderer/compose"
end

def micro_harness_input
  0x11223344
end

def micro_harness_iterations
  1_000_000
end

if defined? NATIVE
  def micro_harness_sample(value)
    PSDNative::Compose::screen(value, value, PSD::Compose::DEFAULT_OPTS)
  end
else
  def micro_harness_sample(value)
    PSD::Compose::screen(value, value)
  end
end

def micro_harness_expected
  0x1A334A75
end

require 'bench/micro-harness'
