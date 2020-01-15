# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'active_model_serializers', '~> 0.10.10' # Allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'bcrypt', '~> 3.1', '>= 3.1.13' # Secure hash algorithm designed for hashing passwords.
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'pg', '>= 0.18', '< 2.0' # Use postgresql as the database for Active Record.
gem 'pry-rails', '~> 0.3.9' # Use Pry as your rails console.
gem 'puma', '~> 4.3', '>= 4.3.1' # Use Puma as the app server.
gem 'rails', '~> 6.0.0' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'.
gem 'seedbank', '~> 0.5.0' # Adds simple rake commands for seeding your database.

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec', '~> 3.8'
  gem 'rubocop', '~> 0.74.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
