# KeychainAccess

Xcframework wrapper for KeychainAccess.

iOS, macOS, and watchOS platforms are included.

⚠️ tvOS is excluded due to errors when publishing the CocoaPod (or running `pod spec lint`).  I _think_ this has to do with detecting the proper slice name when selecting the framework to link against from within the xcframework, but I'm not totally sure.  Side note: the xcframework has "tvos" in its folder name, and I'm wondering if the link step is looking for "appletvos" instead.



### Source
KeychainAccess is here: https://github.com/kishikawakatsumi/KeychainAccess

This repo clones the source and builds an xcframework for it.

### Checking for a new version

```bash
$ fastlane check_xcframework_version
```

If a new version of the source library is available, a new Issue will be created in this repo, and a notice will be posted to `#ios-team`.

This is intedned to be run as a daily task.


### Updating to a new version

```bash
$ fastlane update_xcframework
```

The file `KeychainAccess-xcframework.podspec` is used to control how the xcframework is put together.  The `update_xcframework` lane will only build the platforms listed there, rather than the ones listed in the source `KeychainAccess.podspec` file.  The lane _will_ run a check to make sure that the deployment versions match.

`fastlane update_xcframework` will:

- update the local copy of the source repo with the latest published version
- re-build the xcframework
- You can then optionally continue to 
  - create a new local branch
  - commit the changes to the new release branch
  - create the tag
- With another optional step of publishing the CocoaPod.

You can manually publish the pod, too:

```bash
$ pod repo push ww-digital --allow-warnings
```



### CocoaPods

Podfile:
```
  pod 'KeychainAccess-xcframework'
```

Swift:
```swift
import KeychainAccess
```



## TODO

- Fix inclusion of tvOS (low priority)
- Create nightly task to chek latest published version of 3rd party library
- Make it work with SPM



## Notes

Manual build of xcframework, assumes directory structure:

- 📂 *KeychainAccess-xcframework* <- this repo
  - 📂 *KeychainAccess* <- clone of 3rd party repo
  - 📂 *archives* <- destination of intermediate frameworks
  - 📄 *KeychainAccess-xcframework.podspec*



```bash
xcodebuild archive \
  -project KeychainAccess/Lib/KeychainAccess.xcodeproj \
  -scheme 'KeychainAccess' \
  -configuration Release \
  -destination 'generic/platform=iOS' \
  -archivePath 'archives/KeychainAccess-iOS' \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -project KeychainAccess/Lib/KeychainAccess.xcodeproj \
  -scheme 'KeychainAccess' \
  -configuration Release \
  -destination 'generic/platform=iOS Simulator' \
  -archivePath 'archives/KeychainAccess-iOSSimulator' \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -project KeychainAccess/Lib/KeychainAccess.xcodeproj \
  -scheme 'KeychainAccess' \
  -configuration Release \
  -destination 'generic/platform=watchOS' \
  -archivePath 'archives/KeychainAccess-watchOS' \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -project KeychainAccess/Lib/KeychainAccess.xcodeproj \
  -scheme 'KeychainAccess' \
  -configuration Release \
  -destination 'generic/platform=watchOS Simulator' \
  -archivePath 'archives/KeychainAccess-watchOSSimulator' \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -project KeychainAccess/Lib/KeychainAccess.xcodeproj \
  -scheme 'KeychainAccess' \
  -configuration Release \
  -destination 'generic/platform=OS X' \
  -archivePath 'archives/KeychainAccess-macOS' \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
  -framework archives/KeychainAccess-iOS.xcarchive/Products/Library/Frameworks/KeychainAccess.framework \
  -framework archives/KeychainAccess-iOSSimulator.xcarchive/Products/Library/Frameworks/KeychainAccess.framework \
  -framework archives/KeychainAccess-watchOS.xcarchive/Products/Library/Frameworks/KeychainAccess.framework \
  -framework archives/KeychainAccess-watchOSSimulator.xcarchive/Products/Library/Frameworks/KeychainAccess.framework \
  -framework archives/KeychainAccess-macOS.xcarchive/Products/Library/Frameworks/KeychainAccess.framework \
  -output KeychainAccess.xcframework
```

