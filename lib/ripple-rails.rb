require 'yaml'

def err(s)
	warn s
	exit 1
end

def load_environment(file = '.')
	if File.directory?(file) && File.exists?(File.expand_path("#{file}/config/environment.rb"))
		require "rails"
		require File.expand_path("#{file}/config/environment.rb")
		if defined?(::Rails) && ::Rails.respond_to?(:application)
			# Rails 3
			::Rails.application.eager_load!
		elsif defined?(::Rails::Initializer)
			# Rails 2.3
			$rails_rake_task = false
			::Rails::Initializer.run :load_application_classes
		end
	elsif File.file?(file)
		require File.expand_path(file)
	end
end

def load_config(file = '.')
	if File.directory?(file) && File.exists?(File.expand_path("#{file}/config/ripple.yml"))
		YAML::load_file(File.expand_path("#{file}/config/ripple.yml"))
	elsif File.file?(file)
		YAML::load_file(File.expand_path(file))
	end
end

def run_action(controller, action, params)
	req = ActionDispatch::Request .new({'rack.input' => ''})
	params.each do |(k,v)|
		req[k] = v
	end
	controller.instance_variable_set(:@_request, req)
	controller.send(action)
end
