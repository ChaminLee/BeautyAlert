#
# Be sure to run `pod lib lint BeautyAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BeautyAlert'
  s.version          = '0.1.1'
  s.summary          = 'BeautyAlert provides alerts with custom shapes, colors, buttons'
  s.homepage         = 'https://github.com/ChaminLee/BeautyAlert'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChaminLee' => 'trueman9512@naver.com' }
  s.source           = { :git => 'https://github.com/ChaminLee/BeautyAlert.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/BeautyAlert/Classes/**/*'
  s.frameworks = 'UIKit'
  s.swift_version = "4.0"
end
