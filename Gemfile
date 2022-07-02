source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

gem "image_processing", ">= 1.2"
gem 'aws-sdk-s3'
gem "devise"
gem 'dotenv-rails'
gem 'rmagick'
gem "devise-i18n"
gem "rails-i18n"
gem "sprockets-rails"
gem 'mailjet'
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails", '~> 1.0.0'
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'carrierwave'


group :production do
  gem 'pg'
end

group :development, :test do
  gem "letter_opener"
  # Use sqlite3 as the database for Active Record
  gem "sqlite3", "~> 1.4"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
