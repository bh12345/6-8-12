source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5'
# -------- Added during application development --------
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Haml for simplified HTML generation
gem 'haml', '~> 5.0.4'
# Use jQuery to connect Bootstrap JS
gem 'jquery-rails', '~> 4.3.1'
# Use Vue.js for a better future
gem 'vuejs-rails', '~> 2.4.2'
# Use gem for simple email address validation
gem 'validates_email_format_of'
# Use Bootstrap to create a page design
gem 'bootstrap', '~> 4.0.0.beta2'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails', '~>4.8.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
