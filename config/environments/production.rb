# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options   = { :host => 'larubyconf.com' }

Larc.config[:google_analytics_key]='UA-6891099-1'
