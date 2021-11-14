Pod::Spec.new do |s|
    s.name         = "QRReader"
    s.version      = "1.0.0"
    s.summary      = "A simple QR Code Scanner Framework For IOS"
    s.homepage     = "https://github.com/frameworkios/QRReader"
    s.license      = "Apache-2.0"
    s.author       = { "krishpranav" => "krisna.pranav@gmail.com" }
    s.swift_version = "5.0"
    s.ios.deployment_target = "10.0"
    s.source       = { :git => "https://github.com/frameworkios/QRReader", :tag => s.version }
    s.source_files = "QRReader/*.swift", "QRReader/**/*.swift"
    s.resources    = "QRReader/*.xcassets"
  end