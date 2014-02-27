Pod::Spec.new do |s|
  s.name             = "ZPodUsingAFN"
  s.version          = "0.1.0"
  s.summary          = "This little pod uses AFNetworking"
  s.description      = <<-DESC
                       An example pod that depends on AFNetworking, but uses a subspec for the dependency.
                       DESC
  s.homepage         = "https://github.com/phatblat/SubspecUpdateIssue"
  s.license          = 'MIT'
  s.author           = { "Ben Chatelain" => "benchatelain@gmail.com" }
  s.source           = { :git => "https://github.com/phatblat/SubspecUpdateIssue.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/phatblat'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.dependency 'AFNetworking/NSURLConnection', '~> 2.0'
end
