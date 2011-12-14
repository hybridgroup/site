RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

require 'larc'

Rails::Initializer.run do |config|
  config.time_zone = 'Pacific Time (US & Canada)'

  Larc.config[:google_analytics_key]='UA-6891099-5'
  # UA-6891099-1 - www.larubyconf.com
  # UA-6891099-2 - videos.larubyconf.com
  # UA-6891099-3 - 2009.larubyconf.com
  # UA-6891099-4 - 2010.larubyconf.com
  # UA-6891099-5 - larubyconf.dev 
  #             (or any environments where the key is not overridden)

  # The default locale is :en and all translations from config/locales/*.rb,yml 
  # are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options   = { :host => 'localhost' }

  RFP_START = Date.parse("11/7/2011")
  RFP_END = Date.parse("12/15/2011")
end

require 'will_paginate'
require 'rdiscount'
