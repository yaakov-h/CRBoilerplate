Pod::Spec.new do |s|
  s.name         = "CRBoilerplate"
  s.version      = "0.0.1"
  s.summary      = "A short description of CRBoilerplate."
  s.description  = <<-DESC
	A library of basic boilerplate code for iOS
                    DESC
  s.homepage     = "http://EXAMPLE/CRBoilerplate"

  # Specify the license type. CocoaPods detects automatically the license file if it is named
  # `LICENSE*.*', however if the name is different, specify it.
  s.license      = 'MIT (example)'
  # s.license      = { :type => 'MIT (example)', :file => 'FILE_LICENSE' }
  #
  # Only if no dedicated file is available include the full text of the license.
  #
  # s.license      = {
  #   :type => 'MIT (example)',
  #   :text => <<-LICENSE
  #             Copyright (C) <year> <copyright holders>

  #             All rights reserved.

  #             Redistribution and use in source and binary forms, with or without
  #             ...
  #   LICENSE
  # }

  s.author       = 'Yaakov'
  s.source       = { :git => "https://github.com/yaakov-h/CRBoilerplate.git", :tag => "0.1.0" }

  s.platform     = :ios, '6.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.framework  = 'Foundation', 'UIKit', 'CoreGraphics'
  s.requires_arc = true
end
