source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails"

gem "bootsnap", require: false
gem "importmap-rails"
gem "inline_svg"
gem "puma"
gem "redis"
gem "ruby-openai"
gem "sprockets-rails"
gem "sqlite3"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

group :development, :test do
  gem "dotenv-rails"
end

group :development do
  gem "lefthook"
  gem "standard"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
