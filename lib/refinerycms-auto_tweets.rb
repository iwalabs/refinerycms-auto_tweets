require 'refinerycms-base'

module Refinery
  module AutoTweets

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        RefinerySetting.find_or_set(:twitter_oauth_token,
          '000000000-xxxxxxxxyour_twitter_oauth_tokenxxxxxxxx')
        RefinerySetting.find_or_set(:twitter_oauth_token_secret,
          'xxxxxyour_twitter_oauth_token_secretxxxx')
        RefinerySetting.find_or_set(:twitter_consumer_key,
          'xxxxconsumer_keyxxxx')
        RefinerySetting.find_or_set(:twitter_consumer_secret,
          'xxxxxxxxxxtwitter_consumer_secretxxxxxxxx')
        RefinerySetting.find_or_set(:twitter_message,
          'A new blog post "{title}" is published. Read more at {url}.')
      end

      require 'iwa_extension/auto_tweet'
      config.to_prepare do
        BlogPost.class_eval do
          include ::IwaExtension::AutoTweet
        end
      end
    end
  end
end
