source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
#gem 'bootstrap-sass'
#gem 'autoprefixer-rails'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem "bootstrap_form"
gem 'omniauth-twitter'
gem 'figaro'
gem 'faker'
gem 'httparty'
gem "paperclip", "~> 4.2"
gem 'twilio-ruby', '~> 3.12'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'rails_12factor'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
	gem 'shoulda-matchers', require: false
	gem 'better_errors'
	gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
	gem 'poltergeist'
	gem 'simplecov', require: false  
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
	gem 'database_cleaner'  
	gem 'factory_girl'
	gem 'selenium-webdriver'  
end

group :test do
	gem 'webmock'
	gem 'vcr'
end

