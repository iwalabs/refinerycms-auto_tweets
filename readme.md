# Auto Tweets engine for Refinery CMS.

## Installing

Add refinery-auto_tweets to your Gemfile

    gem 'refinery-auto_tweets', :git => 'git://github.com/iwalabs/refinery-auto_tweets.git'

Run generator

    bundle exec rails g refinerycms_auto_tweets

*Please check your `config/application.rb` for observer configuration*

Set default host URL

    Rails.application.routes.default_url_options[:host]= 'www.iwa.fi'


Run migration

    bundle exec rake db:migrate

Go to Refinery admin and set appropriate Twitter API key.

### Set up Cron Job for blog published in the future.

Set your cron job to run the following task.

    bundle exec rake refinery:auto_tweets:cron

## Standalone Gem set up

### How to build this engine as a gem

    gem build refinerycms-auto_tweets.gemspec
    gem install refinerycms-auto_tweets.gem


### TODO: Sign up for a http://rubygems.org/ account and publish the gem

    gem push refinerycms-auto_tweets.gem

