class CreateAutoTweets < ActiveRecord::Migration

  def self.up
    add_column :blog_posts, :post_tweet, :boolean, default: false
    add_column :blog_posts, :tweeted, :boolean, default: false
  end

  def self.down
    remove_column :blog_posts, :post_tweet
    remove_column :blog_posts, :tweeted
  end

end
