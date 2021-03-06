Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "AdaptiveSpaceItem"
s.version          	= "1.2.0"
s.summary          	= "A NSToolbarItem which will create space to center the next toolbar item"
s.description      	= "A NSToolbarItem sublclass which will create space to center the next toolbar item"
s.homepage         	= "https://github.com/tbaranes/AdaptiveSpaceItem"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/AdaptiveSpaceItem.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.osx.deployment_target 	= '10.10'

s.requires_arc 	   			= true
s.source_files				= 'Source/*.swift'

end