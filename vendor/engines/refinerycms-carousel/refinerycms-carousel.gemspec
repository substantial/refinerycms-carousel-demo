Gem::Specification.new do |s|
  s.author            = "Pete Higgins"
  s.email             = "pete@substantial.com"
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-carousel'
  s.version           = '1.0'
  s.description       = 'Carousel engine for Refinery CMS'
  s.date              = '2011-10-12'
  s.summary           = 'Carousel engine for Refinery CMS'
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
end
