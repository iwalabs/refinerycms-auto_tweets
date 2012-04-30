class BlogPostObserver < ActiveRecord::Observer
	observe :blog_post
	def after_save(record)
    if record.should_tweet?
      record.post_tweet!
    end
  end
end