source 'https://rubygems.org'

require 'rbconfig'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.2.5'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'pg'
# Use SCSS for stylesheets
gem 'puma', '~> 3.0'
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'diffy'
gem 'execjs'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'
gem 'riif'
gem 'coffee-script-source', '1.8.0'
#gem 'wdm','>=0.1.0'
gem 'bootstrap-sass'#, '~> 3.3.5.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw|cygwin/i
gem 'rb-inotify', github: 'nex3/rb-inotify', platforms: :ruby, require: false
gem 'wdm', platforms: :mingw, require: false
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end
group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'high_voltage'
gem 'pundit'
gem 'tinymce-rails'


#WINDOWS Gems That don't play well with nix
platforms :mswin do 
  gem "wdm", :group => [:development, :test]
end


group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'

  gem 'bcrypt', '~> 3.1.10', require: false
  if Bundler::WINDOWS
    gem 'bcrypt-ruby', '~> 3.0.0', require: false
  else
    gem 'bcrypt', '~> 3.1.10', require: false
  end
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

gem 'rubyzip',  "~> 0.9.9"
gem "binding_of_caller"
gem 'paper_trail'
gem 'simple_form'
gem 'axlsx_rails'
gem 'roo'
gem 'tzinfo-data'
gem 'json'