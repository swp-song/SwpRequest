
Pod::Spec.new do |s|

  s.name                  = "SwpRequest"
  s.version               = "1.0.0"
  s.ios.deployment_target = '7.0'
  s.summary               = " AFNetworking 封装 "
  s.homepage              = "https://github.com/swp-song/SwpRequest"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpRequest.git", :tag => s.version }
  s.source_files          = "SwpRequest"
  s.requires_arc          = true
  s.framework             = "Foundation"
  s.dependency "AFNetworking"
  s.dependency "Base64nl"
  
end
