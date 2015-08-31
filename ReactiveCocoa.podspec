Pod::Spec.new do |s|

  s.name         = "ReactiveCocoa"
  s.version      = "3.0-RC.1"
  s.summary      = "A framework for composing and transforming streams of values"
  s.description  = <<-DESC
                   ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values.
                   DESC
  s.homepage     = "https://github.com/ReactiveCocoa/ReactiveCocoa"
  s.license      = "MIT"
  s.author       = { "Josh Abernathy" => "josh@github.com" }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.source       = { :git => "https://github.com/ReactiveCocoa/ReactiveCocoa.git", :branch => "swift2" }
  s.default_subspecs = "UI"
  s.dependency "Result", "~> 0.4.1"

  s.subspec 'no-arc' do |sub|
    sub.source_files = "ReactiveCocoa/Objective-C/RACObjCRuntime.{h,m}"
    sub.requires_arc = false
    sub.frameworks = "Foundation"
  end

  s.subspec 'Core' do |sub|
    sub.source_files = "ReactiveCocoa/**/*.{d,h,m,swift}"
    sub.exclude_files =
      "**/ReactiveCocoa.h",
      "ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText,MK}*"
    sub.header_dir = "ReactiveCocoa"
    sub.private_header_files =
      "**/*Private.h",
      "**/*EXTRuntimeExtensions.h",
      "**/RACEmpty*.h"
    sub.frameworks = "Foundation"
    sub.dependency "ReactiveCocoa/no-arc"
  end

  s.subspec 'UI' do |sub|
    sub.dependency "ReactiveCocoa/Core"
    sub.frameworks = "Foundation"
    sub.ios.source_files =
      "**/ReactiveCocoa.h",
      "ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText,MK}*"
    sub.ios.frameworks = "UIKit"
    sub.osx.source_files =
      "**/ReactiveCocoa.h",
      "ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*"
    sub.osx.frameworks = "AppKit"
  end

end
