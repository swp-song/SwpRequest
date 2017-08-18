#
# Be sure to run `pod lib lint SwpRequest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name              = 'SwpRequest'

  s.version           = "2.5.6"

  s.summary           = "Swp-Song Request Api."

  s.description       = "TODO: Swp-Song Request Api."

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

  s.requires_arc              = true
  s.frameworks                = ["UIKit", "Foundation"]
  s.ios.deployment_target     = '8.0'
  s.ios.vendored_framework    = 'SwpRequestFramework/SwpRequestFramework.framework'

  s.dependency 'AFNetworking'

end
