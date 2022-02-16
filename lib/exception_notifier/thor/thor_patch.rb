require 'thor'

module ExceptionNotifier
  module ThorPatch
		def dispatch(meth, given_args, given_opts, config)
      super(meth, given_args, given_opts, config)
    rescue => e
      command = "thor: #{meth} #{given_args} #{given_opts}"
      ExceptionNotifier::Thor.maybe_deliver_notification(e,
        :thor_command_line => command)
      raise e
    end
  end
end

if Object.const_defined?(:Thor)
  Thor.instance_eval do
    class << self
      prepend ExceptionNotifier::ThorPatch
    end
  end
end
