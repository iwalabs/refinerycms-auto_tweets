namespace :refinery do

  namespace :auto_tweets do

    # call this task my running: rake refinery:auto_tweets:cron

    desc "Check non-tweeted blog post and tweet them"
    task :cron => :environment do
      BlogPost.live.where(post_tweet: true, tweeted: false).each do |post|
        if post.should_tweet?
          puts "Tweet: #{post.title}"
          post.post_tweet!
        end
      end
    end

  end

end