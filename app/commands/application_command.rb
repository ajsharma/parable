# frozen_string_literal: true
require "thor/rails"

module Parable
  class ApplicationCommand < Thor
    include Thor::Rails
  end
end
