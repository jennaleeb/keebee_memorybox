source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use sqlite3 as the database for test/dev and postgres for deployment
group :production do
	gem 'pg'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sqlite3'
  # Nice reporting for testing
  gem 'minitest-reporters'
end


# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Paperclip for file uploads
gem "paperclip", "~> 4.3"
# For videos
gem 'paperclip-av-transcoder'
gem "paperclip-ffmpeg", "~> 1.2.0"

# need a lower version to work with aws
gem 'aws-sdk', '< 2.0'

# Bootstrap
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

# Bootstrap tokenfield
gem 'bootstrap_tokenfield_rails'

# FuelUX (paginated form)
gem "fuelux-rails"

# Less (for FuelUX)
gem 'less-rails', '~> 2.7.0'
gem 'therubyracer'

# Devise authentication
gem 'devise'

# Fancybox lightbox
gem 'fancybox2-rails'

# Pry for debugging (like IRB)
gem 'pry'

#Font awesome
gem 'font-awesome-sass'

# Make multipart forms asynchronous
gem 'remotipart', '~> 1.2'

# Nested form fields add and remove dynamically
gem 'nested_form_fields'

# Generate fake profile information
gem 'faker'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Get more detailed heroku logs
gem 'rails_12factor'

