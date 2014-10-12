
Pod::Spec.new do |s|
  s.name             = "TOCScreenshot"
  s.version          = "0.1.0"
  s.summary          = "A short description of TOCScreenshot."
  s.description      = <<-DESC
                       An optional longer description of TOCScreenshot

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/toco/TOCScreenshot"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tobias Conradi" => "github@tobias-conradi.de" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/TOCScreenshot.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'TOCScreenshot'
#s.resource_bundles = {
#   'TOCScreenshot' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
