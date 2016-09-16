source 'https://rubygems.org'

gem 'rails', '4.2.7.1'

gem 'bugsnag'
gem 'coffee-rails'
gem 'execjs'
gem 'font-awesome-rails'
gem 'fortitude', git: 'https://github.com/ajb/fortitude.git', branch: 'cacheing'
gem 'http'
gem 'rails_oneline_logging'
gem 'sassc-rails'
gem 'simple_form'
gem 'simple_form_legend'
gem 'sprockets-rails'
gem 'sqlite3'
gem 'uglifier'

# Assets
gem 'dvl-core', git: 'https://github.com/dobtco/dvl-core.git'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-underscore'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', require: false
  gem 'guard-rspec'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
end

group :production do
  gem 'rails_12factor'
end
