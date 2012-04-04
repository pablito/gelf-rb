require 'json'
require 'socket'
require 'zlib'
require 'digest/md5'
require 'thread'

if RUBY_VERSION == '1.8.6'
  require 'enumerator'
  module Enumerable
    def count
      self.entries.size
    end
  end

  class Integer
    def ord
      self
    end
  end

  class String
    def bytes(&block)
      if block_given?
        each_byte{|b| yield(b)}
      else
        enum_for(:each_byte)
      end
    end

    def start_with?(*args)
      args.any?{|arg| self =~ %r[\A#{arg}]}
    end
  end
end

module GELF
  SPEC_VERSION = '1.0'
end

require 'gelf/severity'
require 'gelf/ruby_sender'
require 'gelf/notifier'
require 'gelf/logger'
