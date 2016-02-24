Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "FSCalendarKit"
s.summary = "The calendar view for FS."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Paul Gutib" => "paul.gutib@dwebsite.net" }

# For example,
# s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/paulgdwc/FSCalendarKit"

# For example,
# s.homepage = "https://github.com/JRG-Developer/RWPickFlavor"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/paulgdwc/FSCalendarKit.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/JRG-Developer/RWPickFlavor.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"
s.dependency 'Alamofire'
s.dependency 'Fabric'
s.dependency 'Crashlytics'
s.dependency 'Locksmith'
s.dependency 'SwiftyJSON'
s.dependency 'SwiftSpinner'

# 8
s.source_files = "FSCalendarKit/**/**/*.{swift}"

# 9
s.resources = "FSCalendarKit/**/**/*.{png,jpeg,jpg,storyboard,xib}"
end