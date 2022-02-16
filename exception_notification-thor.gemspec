# frozen_string_literal: true

require_relative "lib/exception_notification/thor/version"

Gem::Specification.new do |spec|
  spec.name    = "exception_notification-thor"
  spec.version = ExceptionNotification::Thor::VERSION
  spec.authors = ["Yusei-SHIRAISHI"]
  spec.email   = ["yusei.shiraishi29@gmail.com"]

  spec.summary     = "Sending exception notifications upon Thor task failures"
  spec.description = 'An extension of the exception_notification gem to support' +
                     ' sending mail upon failures in Thor tasks'
  spec.homepage    = "https://github.com/Yusei-SHIRAISHI/exception_notification-thor"
  spec.license     = "MIT"

  spec.platform    = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.6.0"

  spec.require_paths = ["lib"]
end
