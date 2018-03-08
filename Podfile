# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'UseStaticFramework' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', :git => 'https://github.com/ReactiveX/RxSwift.git'
  pod 'RxCocoa', :git => 'https://github.com/ReactiveX/RxSwift.git'
  pod 'RxCocoaRuntime', :podspec => 'https://raw.githubusercontent.com/DianQK/UseStaticFramework/master/RxCocoaRuntime.podspec'
  pod 'RxDataSources', :git => 'https://github.com/RxSwiftCommunity/RxDataSources.git'
  pod 'Differentiator', :git => 'https://github.com/RxSwiftCommunity/RxDataSources.git'

  pod 'Flix', :git => 'https://github.com/DianQK/Flix.git'

  pod 'SQLite.swift', :git => 'https://github.com/stephencelis/SQLite.swift.git'
  pod 'SQLiteObjc', :podspec => 'https://raw.githubusercontent.com/DianQK/UseStaticFramework/master/SQLiteObjc.podspec'

  pod 'Apollo', :git => 'https://github.com/apollographql/apollo-ios.git'
  pod 'Apollo/SQLite',  :git => 'https://github.com/apollographql/apollo-ios.git'

end

pre_install do |installer|
    installer.sandbox.specifications_root.children.each do |podspec|
        if podspec.extname() == '.json'
            edit_pod_spec podspec
        end
    end
end

def edit_pod_spec(file)
    code = File.read(file)
    json = JSON.parse(code)
    json['static_framework'] = true
    if json['name'] == 'RxCocoa'
        json['xcconfig'] = {
            :OTHER_SWIFT_FLAGS => '$(inherited) "-D" "SWIFT_PACKAGE"'
        }
        json['source_files'] = ['RxCocoa/RxCocoa.swift', 'RxCocoa/Common/**/*.{swift}', 'RxCocoa/Traits/**/*.{swift}', 'RxCocoa/Foundation/**/*.{swift}', 'RxCocoa/Runtime/**/*.{swift}', 'Platform/**/*.swift']
        json['preserve_paths'] = ['RxCocoa/RxCocoa.h', 'RxCocoa/*.swift', 'RxCocoa/Common/**/*.{swift,h,m}', 'RxCocoa/Traits/**/*.{swift,h,m}', 'RxCocoa/Foundation/**/*.{swift,h,m}', 'RxCocoa/Runtime/**/*.{swift,h,m}', 'Platform/**/*.swift']
        json['dependencies'] = {
            :RxSwift => '~> 4.1',
            :RxCocoaRuntime => '~> 4.1'
        }
    end
    if json['name'] == 'SQLite.swift'
        json['xcconfig'] = {
            :OTHER_SWIFT_FLAGS => '$(inherited) "-D" "SWIFT_PACKAGE"'
        }
        json['dependencies'] = {
            :SQLiteObjc => '~> 0.11.4'
        }
        json['subspecs'] = [{
            :name => 'standard',
            :source_files => 'Sources/{SQLite,SQLiteObjc}/**/*.{swift}',
            :exclude_files => 'Sources/**/Cipher.swift',
            :library => 'sqlite3'
        }]
    end
    File.write(file, JSON.generate(json))
end

post_install do |installer|
  %w(Pods/Apollo/Sources/ApolloSQLite/*.swift).flat_map { |x| Dir.glob(x) }.each do |file|
    code = File.read(file)
    unless code.include? "import UIKit"
      FileUtils.chmod("+w", file)
      File.write(file, "import UIKit\n" + code)
    end
  end
end
