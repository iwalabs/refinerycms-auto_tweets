Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-auto_tweets'
  s.version           = '0.1'
  s.description       = 'Ruby on Rails Auto Tweets engine for Refinery CMS'
  s.date              = '2012-04-30'
  s.summary           = 'Auto Tweets engine for Refinery CMS'
  s.authors           = ['Iwa Labs']
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']

  s.add_dependency    'refinerycms-blog', '>1.7.0'
  s.add_dependency    'twitter'
end
