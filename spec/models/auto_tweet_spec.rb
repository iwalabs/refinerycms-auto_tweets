require 'spec_helper'

describe AutoTweet do

  def reset_auto_tweet(options = {})
    @valid_attributes = {
      :id => 1
    }

    @auto_tweet.destroy! if @auto_tweet
    @auto_tweet = AutoTweet.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_auto_tweet
  end

  context "validations" do
    
  end

end