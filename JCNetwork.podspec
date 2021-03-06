#
# Be sure to run `pod lib lint JCNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCNetwork'
  s.version          = '1.0'
  s.summary          = 'JCNetwork是一套基于AFNetworking实现的http网络请求'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        JCNetwork是一套基于AFNetworking实现的http网络请求，使用YYMolde解析json格式
                       DESC

  s.homepage         = 'https://github.com/SerilesJam/JCNetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '贾淼' => 'hxjiamiao@126.com' }
  s.source           = { :git => 'https://github.com/SerilesJam/JCNetwork.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'JCNetwork/Classes/JCNetwork.h'
  s.public_header_files = 'JCNetwork/Classes/JCNetwork.h'

  pch_JCNetwork      = <<-EOS
                        #import "AFNetworking.h"
                        #import "NSObject+YYModel.h"
                        #import "YYCache.h"
                        #import "Aspects.h"
                       EOS
  s.prefix_header_contents = pch_JCNetwork

  s.subspec 'Define' do |ss|
    ss.source_files = 'JCNetwork/Classes/Define/*'
    ss.public_header_files = 'JCNetwork/Classes/Define/*.h'
  end

  s.subspec 'Products' do |ss|
    ss.source_files = 'JCNetwork/Classes/Products/*'
    ss.public_header_files = 'JCNetwork/Classes/Products/JC{Request,Responed}Obj.h'

    ss.dependency 'JCNetwork/Define'
  end

  s.subspec 'Handle' do |ss|
    ss.source_files = 'JCNetwork/Classes/Handle/*'
    ss.private_header_files = 'JCNetwork/Classes/Handle/*.h'

    ss.dependency 'JCNetwork/Products'
  end

  s.subspec 'Service' do |ss|
    ss.source_files = 'JCNetwork/Classes/Service/*'
    ss.public_header_files = 'JCNetwork/Classes/Service/JCRequestProxy.h'

    ss.dependency 'JCNetwork/Handle'
  end

  s.frameworks = 'UIKit', 'ImageIO', 'Security', 'CFNetwork', 'SystemConfiguration'
  s.dependency 'AFNetworking'
  s.dependency 'YYModel'
  s.dependency 'YYCache'
  s.dependency 'Aspects'
  s.dependency 'SDWebImage'

end
