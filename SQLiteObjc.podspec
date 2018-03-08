Pod::Spec.new do |s|
  s.name             = "SQLiteObjc"
  s.version          = "0.11.4"
  s.summary          = "A type-safe, Swift-language layer over SQLite3 for iOS and OS X."

  s.description      = <<-DESC
    SQLite.swift provides compile-time confidence in SQL statement syntax and
    intent.
                       DESC

  s.homepage         = "https://github.com/stephencelis/SQLite.swift"
  s.license          = 'MIT'
  s.author           = { "Stephen Celis" => "stephen@stephencelis.com" }
  s.source           = { :git => "https://github.com/stephencelis/SQLite.swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stephencelis'

  s.ios.deployment_target = '8.0'

  s.public_header_files = ['Sources/SQLiteObjc/*/*.{h}', 'Sources/SQLiteObjc/*.{h}']
  s.source_files          = 'Sources/SQLiteObjc/**/*.{h,m}'
  s.static_framework = true

end
