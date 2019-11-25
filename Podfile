source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.4'

use_frameworks!

def shared_pods
  pod 'SwifterSwift', '5.0.0'
end

target 'TelephoneDirectory' do
  shared_pods
  pod 'SwiftSpinner', '2.1.0'
  pod 'GRDB.swift', '4.5.0'
  pod 'SkyFloatingLabelTextField', '3.7.0'
end

target 'TelephoneDirectoryTests' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
