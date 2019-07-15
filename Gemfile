source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'dotenv', '~> 2.2', '>= 2.2.1'
gem 'devise', '~> 4.4', '>= 4.4.1'
# for mobile verification
gem 'twilio-ruby', '~> 4.0.0'
gem 'phonelib'
gem 'rails_admin', '>= 1.0.0.rc'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'paperclip'
gem 'yard'
gem 'friendly_id', '~> 5.1'
gem 'toastr-rails'
gem 'rest-client'
gem "therubyracer"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'brakeman', :require => false
end
group :production do
  gem 'pg', '~> 0.20'
  # gem 'rails_12factor'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rbenv',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', '~> 1.3', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rails-console', '~> 2.2', '>= 2.2.1'
  gem 'capistrano-rails-logs-tail'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# for object searching
gem 'ransack'
# for model schema
gem 'annotate'
gem 'enumerize'
gem 'i18n-tasks'
gem 'whenever', require: false
gem 'globalize'
gem 'rails_admin_translate'


#Api gems
# gem 'active_model_serializers'
