require 'json'

root = ENV["PILOT_ROOT"] || __dir__
pkg_version = lambda do |dir_from_root = '', version = 'version'|
  path = File.join(root, dir_from_root, 'package.json')
  JSON.load(File.read(path))[version]
end

pilot_version = pkg_version.call
react_native_version = pkg_version.call('node_modules/react-native')

podspec = Pod::Spec.new do |s|
  s.name           = 'Pilot'
  s.version        = pilot_version
  s.summary        = 'React Native Components used by icapps.'
  s.homepage       = 'https://github.com/icapps/pilot'
  s.license        = 'MIT'
  s.author         = {  'Dylan Gyesbreghs' => 'dgyesbreghs@gmail.com',
                        'Koen Van Looveren' => 'koen.vanlooveren@icapps.com' }
  s.source         = { :git => 'https://github.com/icapps/pilot.git' }
  s.platform       = :ios, '10.0'
  s.requires_arc   = true
  s.source_files   = 'ios/Pilot/**/*.{h,m}'

  # React
  s.dependency 'React/Core', react_native_version
  s.dependency 'React/CxxBridge', react_native_version
  s.dependency 'React/RCTAnimation', react_native_version
  s.dependency 'React/RCTCameraRoll', react_native_version
  s.dependency 'React/RCTImage', react_native_version
  s.dependency 'React/RCTLinkingIOS', react_native_version
  s.dependency 'React/RCTNetwork', react_native_version
  s.dependency 'React/RCTText', react_native_version

  # React's Dependencies
  s.dependency 'yoga', "#{react_native_version}.React"
  podspecs = [
    'node_modules/react-native/third-party-podspecs/DoubleConversion.podspec',
    'node_modules/react-native/third-party-podspecs/Folly.podspec',
    'node_modules/react-native/third-party-podspecs/glog.podspec'
  ]
  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
    s.dependency spec.name, "#{spec.version}"
  end
end
