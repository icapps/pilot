require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "Pilot"
  s.version      = package['version']
  s.summary      = package['description']

  s.authors      = "icapps.com"
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.platform     = :ios, "10.0"

  s.module_name  = 'Pilot'

  s.source       = { :git => "https://github.com/icapps/pilot.git" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React'
  s.frameworks = 'UIKit'
end