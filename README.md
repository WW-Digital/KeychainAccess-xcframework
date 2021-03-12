# KeychainAccess


Xcframework wrapper for KeychainAccess.

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
- create a new local branch

It's up to you to:

- make sure the changes look correct
- commit the changes to the new release branch
- create the tag

Once all the changes & tag have been pushed to the origin, you can publish the pod:

```bash
$ pod repo push ww-digital --allow-warnings
```



### CocoaPods

```
  pod 'KeychainAccess-xcframework'
```


