#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint connectivity_speed.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'connectivity_speed'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to get more detailed network connection type'
  s.description      = <<-DESC
Flutter plugin to get more detailed network connection type
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Liksi' => 'mathis.ouarnier@liksi.fr' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
