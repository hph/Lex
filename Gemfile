source 'https://rubygems.org'

ruby '2.1.2'

# Web framework
gem 'rails', '~> 4.1.0'

# Ruby interface for PostgreSQL
gem 'pg'

# Application server
gem 'thin', require: false

# Template engine
gem 'haml-rails'

# Alternative database querying library
gem 'sequel'

# Environment variable management
gem 'dotenv-rails'

# Replacement for IRB as an interpreter
gem 'pry-rails'

# Database extension for foreign keys
gem 'foreigner'

# Native C #blank?
gem 'fast_blank'

# Native C JSON serialization
gem 'oj'

# SASS port of Bootstrap
gem 'bootstrap-sass', '~> 3.1.1'

group :development do
  # Asset pipeline compilers
  gem 'coffee-rails', require: false
  gem 'sass-rails', '~> 4.0.3'

  # Asset compression
  gem 'uglifier', require: false

  # Pretty printing
  gem 'awesome_print'

  # Migrations generator for foreigner
  gem 'immigrant'

  # Better error pages
  gem 'better_errors'
  gem 'binding_of_caller', require: false

  # Pre-load Rails environment
  gem 'spring'
end

group :development, :test do
  # Generate fake data
  gem 'ffaker'
end
