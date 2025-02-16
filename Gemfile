# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

gem 'jquery-rails'
gem 'jquery-ui-rails'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :production do
    gem 'matrix'
    gem 'pg', '~> 1.4'
end

group :development, :test do
    # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
    gem 'debug', platforms: %i[mri mingw x64_mingw]
    # Use sqlite3 as the database for Active Record
    gem 'sqlite3', '~> 1.4'

    gem 'byebug'
end

group :development do
    # Use console on exceptions pages [https://github.com/rails/web-console]
    gem 'web-console'

    # Open mailer emails without realy sending them
    gem 'letter_opener'

    # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
    # gem "rack-mini-profiler"

    # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
    # gem "spring"
end

group :test do
    # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
    gem 'capybara'
    gem 'cucumber-rails', require: false
    gem 'database_cleaner'
    gem 'rails-controller-testing'
    gem 'selenium-webdriver'
    gem 'simplecov', require: false
    gem 'webdrivers'
end

gem 'rubocop', '~> 1.45'

gem 'rubocop-capybara'
gem 'rubocop-rails', '~> 2.17'
gem 'rubocop-rspec'

gem 'rspec' # , "~> 3.12"

gem 'rspec-rails' # , "~> 5.0"

gem 'sass-rails', '~> 6.0.0'

gem 'enumerate_it', '~> 3.2.4'

gem 'devise'

gem 'devise_invitable'

gem 'bulma-rails', '~> 0.9.3'

gem 'breadcrumbs_on_rails', '~> 4.1.0'

gem 'kaminari', '~> 1.2.1'

gem 'rails_12factor'

gem 'prawn'

gem 'prawn-table', '~> 0.2.0'

gem 'oso-oso', '~> 0.27.0'

gem 'erb-formatter'

# These need to move into development or not be used in production
gem 'factory_bot_rails', '~> 6.2.0'

gem 'faker', '~> 2.19.0'

gem 'whenever', require: false
