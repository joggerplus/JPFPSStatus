Pod::Spec.new do |s|
  s.name         = "JPFPSStatus"
  s.version      = "0.1.1"
  s.summary      = "JPFPSStatus - Show FPS Status on StatusBar"
  s.homepage     = "https://github.com/joggerplus/JPFPSStatus"
  s.license      = "MIT"
  s.authors      = { "coderyi" => "coderyi@foxmail.com" }
  s.source       = { :git => "https://github.com/joggerplus/JPFPSStatus.git", :tag => "0.1.1" }
  s.frameworks   = 'Foundation', 'UIKit'
  s.platform     = :ios, '7.0'
  s.source_files = 'JPFPSStatus/JPFPSStatus/**/*.{h,m,png}'
  s.requires_arc = true 

end