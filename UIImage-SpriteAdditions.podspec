Pod::Spec.new do |s|
  s.name                  = "UIImage-SpriteAdditions"
  s.version               = "0.1.1"
  s.summary               = "UIImage category that makes sprites from sprite sheet."
  s.homepage              = "http://1337.bg"
  s.license               = "MIT"
  s.author                = {"Bogdan Kovachev" => "extreme@1337.bg"}
  s.social_media_url      = "http://twitter.com/1337bg"
  s.source                = {:git => "https://github.com/eXtreme-bg/UIImage-SpriteAdditions.git", :tag => "v0.1.1"}
  s.requires_arc          = true
  s.platform              = :ios
  s.ios.deployment_target = "7.0"
  s.public_header_files   = "UIImage+SpriteAdditions.h"
  s.source_files          = "UIImage+SpriteAdditions.h", "UIImage+SpriteAdditions.m"
end