Pod::Spec.new do |spec|
  spec.name          = "Afterpay"
  spec.version       = "1.0.1"
  spec.summary       = "Afterpay iOS SDK"
  spec.description   = <<-DESC
    The Afterpay iOS SDK provides drop in UI Components for a smooth Afterpay integration.
  DESC
  spec.homepage      = "https://github.com/afterpay/sdk-ios"
  spec.license       = "Apache License, Version 2.0"
  spec.author        = "Afterpay"
  spec.platform      = :ios, "12.0"
  spec.source        = { :git => "https://github.com/afterpay/sdk-ios.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/Afterpay/"
  spec.swift_version = "5.1"
  spec.framework     = "UIKit"
end
