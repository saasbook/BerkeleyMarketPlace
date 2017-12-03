source 'https://rubygems.org'

ruby '2.3.4'

gem 'rails', '4.2.6'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# use paperclip + cloudinary for image upload
gem "paperclip", "~> 5.1"
gem 'paperclip-cloudinary'
gem 'carrierwave'
gem 'cloudinary'

# for homepage paging
gem 'kaminari'

# Bootstrap, can only use latest beta version for this rails version
gem 'bootstrap', '~> 4.0.0.beta'
gem 'sass-rails', '>= 3.2'

# authentication
gem "omniauth-google-oauth2", "~> 0.2.1"

# generate random description for seed
gem 'word_salad'

# database connection
gem 'pg', '~> 0.20.0'

group :development, :test do
  gem 'simplecov', "~> 0.12.0", :require => false
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem 'cucumber', "~> 2.4.0"
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.6'
  gem "factory_bot_rails"
  gem 'cucumber_factory'
  gem 'poltergeist'
end

group :production do
  gem 'rails_12factor'
end