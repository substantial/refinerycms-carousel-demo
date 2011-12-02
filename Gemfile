source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Sqlite in dev, postgres in production

group :test, :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Linux needs a javascript runtime...
group :test, :development do
  gem 'therubyracer'
end

gem 'thin'

gem "heroku"

gem 'fog'

gem "refinerycms", :git => "git://github.com/resolve/refinerycms.git"

#gem "refinerycms-carousel", :path => "../refinerycms-carousel"
gem "refinerycms-carousel", '1.0', :path => "vendor/engines"

 #  group :development, :test do
  #    gem 'refinerycms-testing', '~> 2.0'
  #  end

  #   USER DEFINED

  # Specify additional Refinery CMS Engines here (all optional):
  #  gem 'refinerycms-blog', :git => 'git://github.com/resolve/refinerycms-blog.git', :branch => 'rails-3-1'
  #  gem 'refinerycms-inquiries', :git => 'git://github.com/resolve/refinerycms-inquiries.git', :branch => 'rails-3-1'
  #  gem 'refinerycms-search', :git => 'git://github.com/resolve/refinerycms-search.git', :branch => 'rails-3-1'
  #  gem 'refinerycms-page-images', :git => 'git://github.com/resolve/refinerycms-page-images.git', :branch => 'rails-3-1'

  #  END USER DEFINED
