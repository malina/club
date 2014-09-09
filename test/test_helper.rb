ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)

require "rails/test_help"
require "minitest/rails"
require "minitest/pride"
require 'mongoid'
require 'mongoid-minitest'

class MiniTest::Spec
  include Mongoid::Matchers
end