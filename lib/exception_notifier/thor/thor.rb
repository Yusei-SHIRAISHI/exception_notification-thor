require 'exception_notifier'

module ExceptionNotifier
  class Thor
    @notifier_options = {}
    @configured       = false

    def self.configure(options = {})
      @configured = true
      @notifier_options.merge!(options)

      if options[:ignore_if]
        ExceptionNotifier.ignore_if do |exception, passed_options|
          passed_options[:env].nil? && options[:ignore_if].call({}, exception)
        end
      end
    end

    def self.configured?
      @configured
    end

    def self.notifier_options
      @notifier_options
    end

		def self.maybe_deliver_notification(exception, data={})
			if configured?
				options = notifier_options
				if !data.empty?
					options = options.dup
					options[:data] = data.merge(options[:data] || {})
				end
				ExceptionNotifier.notify_exception(exception, options)
			end
		end
  end
end
