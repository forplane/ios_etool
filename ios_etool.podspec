Pod::Spec.new do |s|
  s.name             = "ios_etool"
  s.version          = "1.0.0"
  s.summary          = "A marquee view used on iOS."
  s.description      = <<-DESC
                       It is a marquee view used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/forplane/ios_etool.git"
  # s.screenshots      = ""
  s.license= { :type => "MIT", :file => "LICENSE" }
  s.author           = { "huangjhes" => "huangjhes@163.com" }
  s.source           = { :git => "https://github.com/forplane/ios_etool.git", :tag => '1.0.0' }
  # s.social_media_url = ''

  s.platform     = :ios, '4.3'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'etool/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  #s.dependencies  = 'SDCycleScrollView', '~> 1.65','MBProgressHUD', '~> 0.9.2','AFNetworking','~> 3.0','MJRefresh', '~> 3.1.12'
end
