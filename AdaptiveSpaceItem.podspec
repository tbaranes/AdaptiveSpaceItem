Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "AdaptiveSpaceItem"
s.version          	= "1.0.1"
s.summary          	= "A NSToolbarItem which will create space to center the next toolbar item"
s.description      	= "A NSToolbarItem sublclass which will create space to center the next toolbar item"
s.homepage         	= "https://github.com/recisio/AdaptiveSpaceItem"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Recisio" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/recisio/AdaptiveSpaceItem.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'

s.requires_arc 	   			= true
s.source_files				= 'Sources/*.swift'

end