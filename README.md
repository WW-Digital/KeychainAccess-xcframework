# KeychainAccess

Xcframework wrapper for KeychainAccess.

iOS, macOS, and watchOS platforms are included.

⚠️ tvOS is excluded due to errors when publishing the CocoaPod (or running `pod spec lint`).  I _think_ this has to do with detecting the proper slice name when selecting the framework to link against from within the xcframework, but I'm not totally sure.  Sidenote: the xcframework has "tvos" in it's folder name, and I'm wondering if the link step is looking for "appletvos" instead.



### Source
KeychainAccess is here: https://github.com/kishikawakatsumi/KeychainAccess

This repo clones the source and builds an xcframework for it.



### Updating to a new version

```bash
$ fastlane update_framework
```

This will:

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

```
  pod 'KeychainAccess-xcframework'
```


