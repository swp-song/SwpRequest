#
# Be sure to run `pod lib lint SwpRequest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwpRequest'

  s.version          = '2.3.8'

  s.summary          = ' swp-song Request api. '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!


  s.homepage         = 'https://github.com/swp-song/SwpRequest'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpRequest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.vendored_frameworks = 'SwpRequest.framework'
  # s.source_files = 'SwpRequest/SwpRequest.framework/Headers/**/*.{h,m}'
  # s.resource     = 'SwpRequest/SwpRequest.framework/Resources/SwpRequest.bundle'

  s.requires_arc  = true
  s.frameworks    = 'UIKit', 'Foundation'
  # s.public_header_files = 'Pod/Classes/**/*.h'

  s.dependency 'AFNetworking'
  s.dependency 'Base64nl'

end
