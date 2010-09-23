ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

require 'modelizer'

Intercession.test!

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  def refute expr, message = nil
    assert !expr, message
  end

  alias :refute_equal :assert_not_equal
end

class ActiveSupport::TestCase
  @@times = {}

  at_exit do
    at_exit do
      sum   = 0.0
      total = @@times.values.inject { |s,t| s + t }
      max   = @@times.keys.map { |test, klass| klass.size }.max

      @@times.sort_by { |k,v| -v}.each do |(test,klass), time|
        pct = time/total
        sum += pct
        next if sum > 0.8

        puts "%.2fs (%.2f%%): %#{max}s#%s" % [time, pct * 100, klass, test]
      end
    end
  end

  setup     :time_start
  teardown  :time_stop

  def time_start
    @start_time = Time.now
  end

  def time_stop
    @@times[self.name.scan(/[\w:]+/)] = Time.now - @start_time
  end
end if ENV["TIME"]

class Test::Unit::TestCase
  include Modelizer
end
