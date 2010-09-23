require 'rubygems'
require 'isolate'

Isolate.gems "vendor/isolated" do
  gem "rails",         "=2.3.5"
  gem "intercession",  "~> 2.0"      # Session as model
  gem "sqlite3-ruby"                 # database support
  gem "modelizer"
  gem "haml",          "~> 2.0"      # HAML
  gem 'will_paginate', '~> 2.3', :source => 'http://gemcutter.org'
  gem 'rdiscount'
  gem 'facebooker'
  gem 'exceptional',   "~> 2.0"
end
