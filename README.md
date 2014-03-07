# Purpose

This repo serves to provide an example of where CocoaPods version 0.29.0 can misbehave in very specific scenarios. See CocoaPods Core issue [#64](https://github.com/CocoaPods/Core/issues/64) for more details.

# Issue Case #1

Podfile requires version 2.1.0 of AFNetworking. Dependent pod ZPodUsingAFN specificies a loose dependecy on `~> 2.0` of the AFNetworking/NSURLConnection subspec.

## Result

Both version 2.2.0 and 2.1.0 of AFNetworking are installed on top of each other.

```
$ pod install --no-repo-update --verbose

Analyzing dependencies

Finding Podfile changes
  - AFNetworkActivityLogger
  - AFNetworking
  - ZPodUsingAFN

Fetching external sources
-> Fetching podspec for `ZPodUsingAFN` from `ZPodUsingAFN`

Resolving dependencies of `Podfile`
Resolving dependencies for target `Pods' (iOS 7.0)
  - ZPodUsingAFN (from `ZPodUsingAFN`)
    - AFNetworking/NSURLConnection (~> 2.0)
      - AFNetworking/Serialization
      - AFNetworking/Reachability
      - AFNetworking/Security
  - AFNetworking (= 2.1.0)
    - AFNetworking/Serialization
    - AFNetworking/Security
    - AFNetworking/Reachability
    - AFNetworking/NSURLConnection
    - AFNetworking/NSURLSession
      - AFNetworking/NSURLConnection
    - AFNetworking/UIKit
      - AFNetworking/NSURLConnection
  - AFNetworkActivityLogger (= 2.0.1)
    - AFNetworking (= 2.1.0)

Comparing resolved specification to the sandbox manifest
  - AFNetworkActivityLogger
  - AFNetworking
  - ZPodUsingAFN

Downloading dependencies

-> Using AFNetworkActivityLogger (2.0.1)

-> Using AFNetworking (2.1.0)

-> Using AFNetworking (2.2.0)

-> Using ZPodUsingAFN (0.1.0)
  - Running pre install hooks

Generating Pods project
  - Creating Pods project
  - Adding source files to Pods project
  - Adding frameworks to Pods project
  - Adding libraries to Pods project
  - Adding resources to Pods project
  - Linking headers
  - Installing libraries
    - Installing target `Pods-AFNetworkActivityLogger` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-AFNetworkActivityLogger.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-AFNetworkActivityLogger-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-AFNetworkActivityLogger-prefix.pch`
      - Generating dummy source file at `Pods/Pods-AFNetworkActivityLogger-dummy.m`
    - Installing target `Pods-AFNetworking` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-AFNetworking.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-AFNetworking-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-AFNetworking-prefix.pch`
      - Generating dummy source file at `Pods/Pods-AFNetworking-dummy.m`
    - Installing target `Pods-AFNetworking` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-AFNetworking.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-AFNetworking-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-AFNetworking-prefix.pch`
      - Generating dummy source file at `Pods/Pods-AFNetworking-dummy.m`
    - Installing target `Pods-ZPodUsingAFN` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-ZPodUsingAFN.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-ZPodUsingAFN-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-ZPodUsingAFN-prefix.pch`
      - Generating dummy source file at `Pods/Pods-ZPodUsingAFN-dummy.m`
    - Installing target `Pods` iOS 7.0
      - Generating xcconfig file at `Pods/Pods.xcconfig`
      - Generating target environment header at `Pods/Pods-environment.h`
      - Generating copy resources script at `Pods/Pods-resources.sh`
      - Generating acknowledgements at `Pods/Pods-acknowledgements.plist`
      - Generating acknowledgements at `Pods/Pods-acknowledgements.markdown`
      - Generating dummy source file at `Pods/Pods-dummy.m`
  - Running post install hooks
  - Writing Xcode project file to `Pods/Pods.xcodeproj`
  - Writing Lockfile in `Podfile.lock`
  - Writing Manifest in `Pods/Manifest.lock`
  ```

# Issue Case #2

Podfile requires version 2.1.0 of AFNetworking. Dependent pod ZPodUsingAFN specificies a loose dependecy on `~> 2.0` of the AFNetworking top-level spec.

## Result

Version 2.2.0 of AFNetworking is installed despite the exact version 2.1.0 specified in the Podfile.

```
$ pod install --no-repo-update --verbose

Analyzing dependencies

Finding Podfile changes
  M AFNetworking
  - AFNetworkActivityLogger
  - ZPodUsingAFN

Fetching external sources
-> Fetching podspec for `ZPodUsingAFN` from `ZPodUsingAFN`

Resolving dependencies of `Podfile`
Resolving dependencies for target `Pods' (iOS 7.0)
  - ZPodUsingAFN (from `ZPodUsingAFN`)
    - AFNetworking (~> 2.0)
      - AFNetworking/Serialization
      - AFNetworking/Security
      - AFNetworking/Reachability
      - AFNetworking/NSURLConnection
        - AFNetworking/Serialization
        - AFNetworking/Reachability
        - AFNetworking/Security
      - AFNetworking/NSURLSession
        - AFNetworking/NSURLConnection
      - AFNetworking/UIKit
        - AFNetworking/NSURLConnection
        - AFNetworking/NSURLSession
  - AFNetworking (= 2.1.0)
  - AFNetworkActivityLogger (= 2.0.1)
    - AFNetworking (~> 2.0)

Comparing resolved specification to the sandbox manifest
  M AFNetworking
  M ZPodUsingAFN
  - AFNetworkActivityLogger

Downloading dependencies

-> Using AFNetworkActivityLogger (2.0.1)

-> Installing AFNetworking (2.2.0)
 > GitHub download
   $ /usr/local/bin/git config core.bare
   true
   $ /usr/local/bin/git config core.bare
   true
 > Updating cache git repo (/Users/phatblat/Library/Caches/CocoaPods/GitHub/a7f129229d47b74a225e1e2ed0bc604f35d71ac7)
     $ /usr/local/bin/git remote update
     Fetching origin
 > Cloning to Pods folder
     $ /usr/local/bin/git clone "/Users/phatblat/Library/Caches/CocoaPods/GitHub/a7f129229d47b74a225e1e2ed0bc604f35d71ac7" "/Users/phatblat/dev/ios/SubspecUpdateIssue/Pods/AFNetworking"
     Cloning into '/Users/phatblat/dev/ios/SubspecUpdateIssue/Pods/AFNetworking'...
     done.
   $ /usr/local/bin/git fetch origin tags/2.2.0 2>&1
   From /Users/phatblat/Library/Caches/CocoaPods/GitHub/a7f129229d47b74a225e1e2ed0bc604f35d71ac7
    * tag               2.2.0      -> FETCH_HEAD
   $ /usr/local/bin/git reset --hard FETCH_HEAD
   HEAD is now at 6a78f1b Bumping version to 2.2.0
   $ /usr/local/bin/git checkout -b activated-pod-commit 2>&1
   Switched to a new branch 'activated-pod-commit'
   $ /usr/local/bin/git submodule update --init

-> Installing ZPodUsingAFN (0.1.0)
  - Running pre install hooks

Generating Pods project
  - Creating Pods project
  - Adding source files to Pods project
  - Adding frameworks to Pods project
  - Adding libraries to Pods project
  - Adding resources to Pods project
  - Linking headers
  - Installing libraries
    - Installing target `Pods-AFNetworkActivityLogger` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-AFNetworkActivityLogger.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-AFNetworkActivityLogger-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-AFNetworkActivityLogger-prefix.pch`
      - Generating dummy source file at `Pods/Pods-AFNetworkActivityLogger-dummy.m`
    - Installing target `Pods-AFNetworking` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-AFNetworking.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-AFNetworking-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-AFNetworking-prefix.pch`
      - Generating dummy source file at `Pods/Pods-AFNetworking-dummy.m`
    - Installing target `Pods-ZPodUsingAFN` iOS 7.0
      - Adding Build files
      - Adding resource bundles to Pods project
      - Generating public xcconfig file at `Pods/Pods-ZPodUsingAFN.xcconfig`
      - Generating private xcconfig file at `Pods/Pods-ZPodUsingAFN-Private.xcconfig`
      - Generating prefix header at `Pods/Pods-ZPodUsingAFN-prefix.pch`
      - Generating dummy source file at `Pods/Pods-ZPodUsingAFN-dummy.m`
    - Installing target `Pods` iOS 7.0
      - Generating xcconfig file at `Pods/Pods.xcconfig`
      - Generating target environment header at `Pods/Pods-environment.h`
      - Generating copy resources script at `Pods/Pods-resources.sh`
      - Generating acknowledgements at `Pods/Pods-acknowledgements.plist`
      - Generating acknowledgements at `Pods/Pods-acknowledgements.markdown`
      - Generating dummy source file at `Pods/Pods-dummy.m`
  - Running post install hooks
  - Writing Xcode project file to `Pods/Pods.xcodeproj`
  - Writing Lockfile in `Podfile.lock`
  - Writing Manifest in `Pods/Manifest.lock`
```
