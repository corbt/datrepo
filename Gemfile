source 'https://rubygems.org'

gem 'rails', '4.0.3'

gem 'pg'
gem 'formtastic-bootstrap', '~> 3.0.0.rc.2'
gem 'formtastic'

# Front end
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'bourbon'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'nokogiri'

# Admin
gem 'activeadmin', github: 'gregbell/active_admin'  

# Blog
# gem 'bloggy', :github => 'jesseadams/bloggy', :branch => 'fix-rake-generate'
# gem 'jekyll-slim'

# Performance
gem 'actionpack-page_caching'
# gem 'redis'

group :production do 
  gem 'unicorn'
end

group :development do 
  gem 'capistrano', '~> 3', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false

  gem 'html2slim', require: false
  gem 'quiet_assets'
  gem 'railroady'
end

# Testing
gem 'rspec-rails', :group => [:development, :test]
gem "factory_girl_rails", :group => [:development, :test]
gem "database_cleaner", :group => :test
gem "email_spec", :group => :test

# Static pages
gem 'high_voltage'

gem 'slim'
gem 'redcarpet'

# Search
gem "searchkick"

# gem 'whenever'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'