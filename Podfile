platform :ios, "7.0"

xcodeproj "SubspecUpdateIssue"

#
# Declaring the pod dependency before AFNetworking is when issues arise.
# - pod which depends on shared dependency must appear before it in Podfile
# - pod which depends on shared dependency must be string sorted after it (install progress shows in this order)
# - if pod depends on a subspec of shared dependency, both the pinned version and the latest version of shared dependency will be installed
# - if pod depends on top-level spec of shared dependency, only the latest version of shared dependency will be installed
#
pod "ZPodUsingAFN", :path  => "ZPodUsingAFN"

pod "AFNetworking", "= 2.1.0"
# pod "AFNetworking", "~> 2.0"
# pod "AFNetworking/UIKit", "2.1.0"
# pod "AFNetworking/UIKit", "~> 2.0"

#
# This pod is included to show the compile issues in the app when the dependency resolution breaks.
#
pod "AFNetworkActivityLogger", "~> 2.0"

#
# Declaring the pod dependency down here doesn't cause any issues.
#
# pod "ZPodUsingAFN", :path  => "ZPodUsingAFN"
