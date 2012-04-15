source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'jquery-rails'
gem 'haml'
gem 'paperclip'
gem 'execjs'
gem 'therubyracer'

# login gems
gem "ruby-openid"
gem "rack-openid"
gem "erb2haml", :group => :development

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gems used for testing and development
group :development, :test do
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'ruby-debug19', :require => 'ruby-debug'
  # TODO: fix this ugliness
  if RUBY_VERSION.include? '1.9.3'
    gem 'linecache19', '0.5.13'
  else
    gem 'linecache19', '0.5.12'
  end
end

group :test do 
  gem 'cucumber-rails'
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