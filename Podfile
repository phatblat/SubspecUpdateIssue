platform :ios, "7.0"

xcodeproj "SubspecUpdateIssue"

#
# Declaring the pod dependency before AFNetworking is when issues arise.
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
