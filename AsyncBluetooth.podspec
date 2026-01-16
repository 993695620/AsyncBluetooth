Pod::Spec.new do |s|
  s.name             = 'AsyncBluetooth'
  s.version          = '1.0.0'  # 请根据实际情况设置版本号
  s.summary          = 'Async/await Bluetooth library for Apple platforms'
  s.description      = <<-DESC
    AsyncBluetooth provides async/await APIs for Bluetooth operations on iOS, macOS, and watchOS.
    It wraps Apple's CoreBluetooth framework with modern Swift concurrency patterns.
  DESC
  
  s.homepage         = 'https://github.com/yourusername/AsyncBluetooth'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your@email.com' }
  s.source           = { 
    :git => 'https://github.com/yourusername/AsyncBluetooth.git', 
    :tag => s.version.to_s 
  }
  
  # 平台要求 - 与 SPM 配置保持一致
  s.ios.deployment_target = '14.0'
  s.osx.deployment_target = '11.0'
  s.watchos.deployment_target = '7.0'
  
  # Swift 版本
  s.swift_version = '6.0'  # SPM 使用 swift-tools-version:6.0 但支持 Swift 5
  
  # 源文件
  s.source_files = 'Sources/**/*.{swift,m,h}'
  
  # 资源文件 - 隐私清单文件
  s.resources = ['Sources/PrivacyInfo.xcprivacy']
  
  # 框架依赖
  s.frameworks = 'Foundation', 'CoreBluetooth'
  
  # 排除文件
  s.exclude_files = [
    'Package.swift',
    'Tests/**/*',
    'Examples/**/*',
    '.swiftpm/**/*',
    'DerivedData/**/*'
  ]
  
  # 如果需要额外的编译设置
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '6.0',
    'APPLICATION_EXTENSION_API_ONLY' => 'YES',  # 如果支持扩展
    #'OTHER_SWIFT_FLAGS' => '$(inherited) -enable-experimental-concurrency'
    'OTHER_SWIFT_FLAGS' => '$(inherited) -Xfrontend -strict-concurrency=complete'
  }
end
