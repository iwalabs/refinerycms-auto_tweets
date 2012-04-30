require 'twitter'

module IwaExtension
  module Tweeter
    def self.post_tweet_message(title, url)
      ::Twitter.configure do |config|
        config.consumer_key = RefinerySetting.get(:twitter_consumer_key)
        config.consumer_secret = RefinerySetting.get(:twitter_consumer_secret)
        config.oauth_token = RefinerySetting.get(:twitter_oauth_token)
        config.oauth_token_secret = RefinerySetting.get(:twitter_oauth_token_secret)
      end
      message = RefinerySetting.get(:twitter_message)
      message = message.gsub('{title}', title).gsub('{url}', url)
      ::Twitter.update(message)
    end
  end

  module AutoTweet
    def should_tweet?
      live? && post_tweet && !tweeted
    end

    def post_tweet!
      url = Rails.application.routes.url_helpers.blog_post_url(self)
      # begin
        puts "SHOULD TWEET"
        ::IwaExtension::Tweeter.post_tweet_message(title, url)
        puts "TWEETED"
        self.tweeted = true
        self.save
        puts "SAVED"
      # rescue
      # end
    end
  end
end

