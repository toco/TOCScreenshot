
Pod::Spec.new do |s|
  s.name             = "TOCScreenshot"
  s.version          = "1.0.0"
  s.summary          = "TOCScreenshot is a simple helper to take screenshots in code. You can optionally crop the status bar region."
  s.description      = <<-DESC
						In default configuration it saves the screenshots in a folder named with locale, screen size and screen resolution in the application documents directory.
						The group path can be easily changed to e.g. save them in the project source path.

                       DESC
  s.homepage         = "https://github.com/toco/TOCScreenshot"
  s.screenshots     = "https://raw.githubusercontent.com/toco/TOCScreenshot/master/Example/Screenshots/en_US-375x667@2x/2014-10-12_18-26-24-181_en_US-375x667@2x.png"
  s.license          = 'MIT'
  s.author           = { "Tobias Conradi" => "github@tobias-conradi.de" }
  s.source           = { :git => "https://github.com/toco/TOCScreenshot.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'TOCScreenshot'
  s.frameworks = 'UIKit'
end
