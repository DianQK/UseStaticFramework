Pod::Spec.new do |s|
  s.name             = "RxCocoaRuntime"
  s.version          = "4.1.2"
  s.summary          = "RxSwift Cocoa extensions"
  s.description      = <<-DESC
* UI extensions
* NSURL extensions
* KVO extensions
                        DESC
  s.homepage         = "https://github.com/ReactiveX/RxSwift"
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/ReactiveX/RxSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'RxCocoa/Runtime/include/*.{h}'
  s.source_files          = 'RxCocoa/Runtime/**/*.{h,m}'
  s.static_framework = true

end
