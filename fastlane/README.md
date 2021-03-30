fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
### mobile_sandbox
```
fastlane mobile_sandbox
```
Mobile Fastlane lane for testing
### which_ruby
```
fastlane which_ruby
```
Display the Ruby environment information
### keys
```
fastlane keys
```
WWMobile secret key management.

Options:

  action:set - Add or modify a key

  action:delete - Remove a key

  action:install - Install all keys (the default action)

  module:MODULE - override the cocoapods-keys module

                  (default is WWMobile, or value of lane_context[:cocoapods_keys_module])

Sample usage:

  fastlane keys

  fastlane keys action:install

    (installs all keys)

  fastlane keys action:set

    (add or modify a key)

  fastlane keys action:delete

    (delete an existing key)
### show_ww_env
```
fastlane show_ww_env
```
List all environment variables stored in the MacOS keychain
### trigger_build
```
fastlane trigger_build
```
Trigger build of this branch on CircleCI

repo_name - Optional (defaults to current repository)

branch_name - Optional (defaults to current branch)

slack_channel - Optional (defaults to "#ios-status")

Sample usage:

- trigger_build(slack_channel: "#connect")
### circle_build_artifacts
```
fastlane circle_build_artifacts
```
Get CircleCI build artifacts for specified repo and build number
### create_appcenter_app_if_needed
```
fastlane create_appcenter_app_if_needed
```
Create App Center app or find existing app and return JSON hash
### publish_qa_build
```
fastlane publish_qa_build
```
If valid branch, create App Center app (if needed) and trigger build
### appcenter_cleanup
```
fastlane appcenter_cleanup
```
If merging PR, delete associated App Center app, if any
### select_appcenter_team
```
fastlane select_appcenter_team
```
Prompts you to select App Center distribution group and returns json hash
### select_appcenter_app
```
fastlane select_appcenter_app
```
Prompts you to select App Center app and returns json hash
### get_appcenter_teams
```
fastlane get_appcenter_teams
```
Queries App Center API for WW teams and returns array of json hashes
### get_appcenter_apps
```
fastlane get_appcenter_apps
```
Queries App Center API for WW apps and returns array of json hashes
### list_appcenter_apps
```
fastlane list_appcenter_apps
```
Lists all app center apps by name, with the last build date for each
### create_appcenter_app
```
fastlane create_appcenter_app
```
Prompts for name, release type. Creates App Center app and returns json hash

To bypass prompts, use title and type arguments:

fastlane create_appcenter_app title:'FTK-1234' type:enterprise
### delete_appcenter_app
```
fastlane delete_appcenter_app
```
Delete selected App Center app
### appcenter_invite
```
fastlane appcenter_invite
```
Invite a distribution group to selected App Center app
### add_appcenter_user
```
fastlane add_appcenter_user
```
Invite user via email to a selected App Center app
### get_appcenter_groups
```
fastlane get_appcenter_groups
```
Get all distribution groups assigned to an app
### get_platform
```
fastlane get_platform
```
Get current platform, if available, or ask the user for the platform otherwise
### pr
```
fastlane pr
```
Create pull request from current branch to develop and launch URL
### pull_request
```
fastlane pull_request
```
Create a pull request

Options:

  branch_name - (optional) defaults to current git_branch

  base - (optional) base branch for new PR, defaults to develop

  message - Title for new PR, if empty fastlane will prompt for one

  body - (optional) PR description

  launch_url - (optional) true/false, if true the PR's URL will be opened in a browser, defaults to false
### current_repo_name
```
fastlane current_repo_name
```
Get name of current github repository (e.g., ios-wwmobile)

----

## iOS
### ios shared_sandbox
```
fastlane ios shared_sandbox
```
Shared sandbox to test new lanes
### ios check_xcframework_version
```
fastlane ios check_xcframework_version
```
Checks for new versions of a 3rd party library.

For use in repos that build an xcframework.
### ios update_xcframework
```
fastlane ios update_xcframework
```
Builds an xcframework for a 3rd party library.

xcframework_config.yml must be in the xcframework repo, at /fastlane/xcframework_config.yml.

Options:

  version - (optional) Explicit version to archive.  Defaults to latest.

  debug_symbols - (optional) If config file has dSYMs off, use this to temporarily turn them on.  Defaults to config file or false.

Sample usage:

  fastlane update_xcframework

    (generate xcframework for latest version)

  fastlane update_xcframework version:1.2.3

    (generate xcframework for version 1.2.3)

  fastlane update_xcframework debug_symbols:true

    (generate xcframework with debug symbols)
### ios loggly_errors
```
fastlane ios loggly_errors
```
Get top five errors from Loggly
### ios trigger_nightly_builds
```
fastlane ios trigger_nightly_builds
```
Trigger CircleCI to make adhoc and enterprise App Center builds
### ios trigger_adhoc_build
```
fastlane ios trigger_adhoc_build
```
Trigger CircleCI to build 'WW Mobile - Nightly Build' on App Center
### ios trigger_enterprise_build
```
fastlane ios trigger_enterprise_build
```
Trigger CircleCI to build 'WW Mobile - Beta' on App Center
### ios trigger_publish_pod
```
fastlane ios trigger_publish_pod
```
Trigger CI to publish CocoaPod from current repo

Options:

  repo_name - (optional) Defaults to current repository

  branch_name - (optional) develop, master, or another source branch

  release_type - (optional) major, minor, hotfix, or none

  bump_podfile - (optional) Defaults to true.

  merge_to_master - (optional) Set true to automatically merge the release branch to master. false to create a PR.

  send_slack_msg - (optional) Send a Slack notification when published. Defaults to true.

Sample usage:

  fastlane trigger_publish_pod branch_name:feature/FND-100

    (publish pod from the 'feature/FND-100' branch)
### ios publish_pod_ci
```
fastlane ios publish_pod_ci
```
Publish this Cocoapod on CI

(this lane only works on CircleCI server)

podspec_name - (optional) Name of the podspec (e.g. WWCore) Defaults to first found podspec in repo.
### ios trigger_integration_build
```
fastlane ios trigger_integration_build
```
Make enterprise build of ios-wwmobile pointing to feature branch

repo_name - Optional (defaults to current repository)

branch_name - Optional (defaults to current branch)

Sample usage:

- trigger_integration_build repo_name:"ios-tracking" branch_name:"feature/FTK-1234"
### ios deploy
```
fastlane ios deploy
```
CircleCI: Build Enterprise IPA and upload to App Center

(this lane only works on CircleCI server)
### ios lint
```
fastlane ios lint
```
Lint Swift against .swiftlint.yml file

path - Optional (defaults to "Example")

Sample usage:

- lint path:"ExampleApp"
### ios slack_reports
```
fastlane ios slack_reports
```
Post test and coverage report URLs to Slack
### ios slack_test_report
```
fastlane ios slack_test_report
```
Post unit test report URL to Slack
### ios slack_coverage_report
```
fastlane ios slack_coverage_report
```
Post test coverage report URL to Slack
### ios slack_ui_report
```
fastlane ios slack_ui_report
```
Post UI test report URL to Slack
### ios report_url
```
fastlane ios report_url
```
Get matching report URL from CircleCI build artifacts
### ios register_adhoc_device
```
fastlane ios register_adhoc_device
```
Register device UUID with Apple Developer Portal for adhoc (IAP)
### ios register_development_device
```
fastlane ios register_development_device
```
Register device UUID with Apple Developer Portal for development
### ios match_all
```
fastlane ios match_all
```
Install all certificates and provisioning profiles - will not re-create them
### ios match_enterprise
```
fastlane ios match_enterprise
```
Install Enterprise provisioning profiles
### ios add_testflight_user
```
fastlane ios add_testflight_user
```
Add user to TestFlight distribution group
### ios remove_testflight_user
```
fastlane ios remove_testflight_user
```
Remove user from TestFlight
### ios update_podfile
```
fastlane ios update_podfile
```
Update WWMobile Podfile to latest versions of WW pods
### ios list_pods
```
fastlane ios list_pods
```
List latest versions of WW pods for Podfile
### ios lint_pod
```
fastlane ios lint_pod
```
Lint this Cocoapod before publishing it
### ios publish_pod
```
fastlane ios publish_pod
```
Publish a new version of this Cocoapod
### ios local_pod
```
fastlane ios local_pod
```
Point Podfile to local files for given WW pod

Ex. `fastlane ios local_pod pod:tracking`

pod - (required) the name of the local pods you want to point to, separated by ',' (i.e. tracking,foundation)

action - (optional) specify CocoaPods command to run after completing (defaults to `none`)
### ios remote_pod
```
fastlane ios remote_pod
```
Point specified WW pod to specified remote branch

Ex. `fastlane ios remote_pod pod:tracking branch:master`

branch - (optional) the remote branch you want to point to (defaults to develop)

pod - (optional) the name of the remote pods you want to point to, separated by ',' (i.e. tracking,foundation)

action - (optional) specify CocoaPods command to run after completing (defaults to `none`)
### ios bump_podspec
```
fastlane ios bump_podspec
```
Increment podspec version number and pod update

podspec_name - (optional) Name of the podspec (e.g. WWFoundation) Defaults to first found podspec in repo.
### ios ascii
```
fastlane ios ascii
```
Success messages

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
