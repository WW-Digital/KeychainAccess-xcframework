Pod::Spec.new do |s|
  s.cocoapods_version = '>= 1.10.0'
  s.name                = 'KeychainAccess-xcframework'
  
  s.module_name         = 'KeychainAccess'
  s.version             = '4.2.2'

  s.summary             = 'KeychainAccess is a simple Swift wrapper for Keychain that works on iOS and OS X.'
  s.description         = <<-DESC
                          xcframework for KeychainAccess from https://github.com/kishikawakatsumi/KeychainAccess
                          DESC
  s.homepage            = 'https://github.com/kishikawakatsumi/KeychainAccess'
  s.license             = 'MIT'
  s.author              = { 'kishikawa katsumi' => 'kishikawakatsumi@mac.com' }

  s.source              = { :git => 'git@github.com:WW-Digital/KeychainAccess-xcframework.git', :tag => "#{s.version}" }

  s.requires_arc        = true
  
  s.vendored_frameworks = 'KeychainAccess.xcframework'

  s.swift_version       = '5.1'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '9.0'
end
