#!/usr/bin/env ruby

require "lib/exception_notification/thor"

class SampleTask < Thor
  def raise_task(option)
    raise StandardError
  end
  def not_raise_task(option)
  end
end

SampleTask.start
