# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/routing"
require "rulers/array"
require "debug"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { "Content-Type" => "text/html" },
       [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    attr_reader :env
  end
end
