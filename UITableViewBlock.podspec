
Pod::Spec.new do |s|
  s.name         = "UITableViewBlock"
  s.version      = "1.0"
  s.summary      = "A UITableView Block"
  s.homepage     = "https://github.com/HeDong1117/UITableViewBlock"
  s.license      = "MIT"
  s.author       = { "HeDong" => "57008939@qq.com" }
  s.source       = { :git => "https://github.com/HeDong1117/UITableViewBlock.git", :tag => s.version }
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source_files = "UITableViewBlock/Category/*.{h,m}"

end