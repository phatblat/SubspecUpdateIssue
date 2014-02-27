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

  #
  # This loose top-level spec dependency causes only the latest (2.2.0) AFNetworking version to be installed, despite any version pinning in the Podfile.
  #
  s.dependency 'AFNetworking', '~> 2.0'

  #
  # This loose subspec dependency causes both AFNetworking versions 2.2.0 and 2.1.0 to be installed.
  #
  # s.dependency 'AFNetworking/NSURLConnection', '~> 2.0'
end
