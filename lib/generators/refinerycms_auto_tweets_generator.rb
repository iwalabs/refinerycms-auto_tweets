class RefinerycmsAutoTweets < Refinery::Generators::EngineInstaller

  source_root File.expand_path('../../../', __FILE__)
  engine_name "auto_tweets"

  def create_view_file
    copy_file 'app/views/admin/blog/posts/_form.html.erb'
  end

  def create_initializer_file
    puts "Updating active_record.observers in application.rb"
    application "config.active_record.observers = :blog_post_observer"
  end

end
