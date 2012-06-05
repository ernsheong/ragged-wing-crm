source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'kaminari'
gem 'jquery-rails'
gem 'haml'
gem 'paperclip'
gem 'execjs'
gem 'rails3-jquery-autocomplete'

if RUBY_PLATFORM.downcase.include?("mingw")
  gem 'eventmachine', '1.0.0.beta.4.1' 
else
  gem 'eventmachine'
end

gem 'thin'

# dont include 'therubyracer' on windows
platforms :ruby do
  gem 'therubyracer'
end

# login gems
gem "ruby-openid"
gem "rack-openid"
gem "erb2haml", :group => :development

gem "gchartrb", "~> 0.8"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gems used for testing and development
group :development, :test do
  gem "spork-rails"
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails', "~> 2.0"
  gem 'simplecov'
  gem 'ruby-debug19', :require => 'ruby-debug'       
  gem "ruby-debug-base19", "~> 0.11.25"
  gem "factory_girl_rails", "~> 3.0"
  gem 'ffi', '1.0.10'
  gem 'guard','0.10.0'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/
  # TODO: fix this ugliness
  #if RUBY_VERSION.include? '1.9.3'
  #  gem 'linecache19', '0.5.13'
  #else
  #  gem 'linecache19', '0.5.12'
  #end
end

group :test do 
  gem 'cucumber-rails', :require => false
end

# gems used in production
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'bootstrap-sass', '~> 2.0.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.2.3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'