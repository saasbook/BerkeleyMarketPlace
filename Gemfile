source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use Haml as the templating library
gem 'haml'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# PaperClip, for image uploading
gem "paperclip", "~> 5.1"

gem 'paperclip-cloudinary'
# Cloudinary Gem
gem 'carrierwave'
gem 'cloudinary'

# for homepage paging
gem 'kaminari'

# Bootstrap, can only use latest beta version for this rails version
# gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'sass-rails', '>= 3.2'

# db cleaner for seed
gem 'database_cleaner'

# authentication
gem "omniauth-google-oauth2", "~> 0.2.1"

gem 'word_salad'

# web console, temporarily disabled for C9 dev environment
# group :development do
#   gem 'web-console', '~> 2.0'
# end

group :development, :test do
  gem 'simplecov', "~> 0.12.0", :require => false
  gem "codeclimate-test-reporter", "~> 1.0.0"
  
  gem 'byebug'
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.6'

  gem 'guard-rspec'

  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'
  gem 'pg'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'
end