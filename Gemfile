source "https://rubygems.org"

ruby "2.3.1"

gem "delayed_job_active_record"
gem "high_voltage"
gem "jquery-rails"
gem "normalize-rails"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "simple_form"
gem "title"
gem "rake", "~> 11.2.0"
gem "awesome_print", require: "ap"
gem "dotenv-rails"
# user_choice
gem "underscore-rails"
gem "rails_admin"
gem "paper_trail"
gem "bootstrap-kaminari-views"
gem "kaminari-i18n"
gem "kaminari"
gem "hirb-unicode"
gem "haml-rails"
gem 'slim' # dependency for rendering views of 'ack_rails_admin_jcrop'
gem "gmaps4rails"
gem "devise"
gem "ckeditor"
gem "devise-bootstrap-views"
gem "twitter-bootstrap-rails"
gem 'paperclip', '~> 5.1'
gem "sentry-raven"
gem "therubyracer"

# shop gems
gem "font-awesome-rails"
gem "select2-rails"
gem 'owl_carousel-rails'
gem 'bxslider-rails'
gem 'jquery-ui-rails'
gem "animate-rails"
gem 'jquery-countdown-rails'
gem 'rails-i18n', '~> 5.0', '>= 5.0.1'
gem 'ack_rails_admin_jcrop' #, git: 'git://github.com/ack43/rails_admin_jcrop.git'
gem 'rails_admin_dropzone'
gem 'elevatezoom-rails'
gem 'fancybox-rails'
gem 'friendly_id'
# forked and applied pull request https://github.com/norman/babosa/pull/42
gem 'babosa', :git => 'https://github.com/Lumbe/babosa.git', :branch => 'master'
gem "gretel"
gem 'novaposhta2', '~> 0.0.4'

group :assets do
  gem "sass-rails"
  gem "autoprefixer-rails"
  gem "coffee-rails"
  gem "uglifier"
end

group :development do
  gem "rubycritic", require: false
  gem "rubocop", require: false
  gem "railroady"
  gem "meta_request" # link for chrome add-on. https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg
  # gem "mailcatcher"
  gem "guard-rubocop"
  gem "guard"
  gem "guard-livereload", "~> 2.4", require: false
  gem "guard-puma", require: false
  gem "guard-migrate", require: false
  gem "guard-rspec", require: false
  gem "guard-bundler", require: false
  gem "annotate"
  # gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "bullet"
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-rescue"
  gem "pry-state"
  gem "pry-stack_explorer"
  gem "better_errors"
  gem "binding_of_caller"
  gem "hirb"
  gem "listen"
end

group :development, :test do
  gem "faker"
  gem "factory_girl_rails"
  gem "bundler-audit", require: false
  gem "rspec-rails"
end

group :test do
  gem "fuubar"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
