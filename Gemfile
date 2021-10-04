source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end
group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end
gem 'bootstrap-sass'
gem 'devise'
gem 'high_voltage'
gem 'jquery-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f' # to fix yanked mimemagic
group :development do
  gem 'better_errors'
  gem 'rails_layout'
end
