# Description

This is a fork of [`expo-image-picker`](https://www.npmjs.com/package/expo-image-picker) with additional utility as required by [swsh](https://www.joinswsh.com). Feel free to use at your own risk: This is considered to be very unstable and untested for most use cases.

Due to the monstrous size of Expo, this is a fork of a subdirectory in it so we don't have to download the entire repository. [Guide for forking and updating](https://stackoverflow.com/a/24577293)

To get a branch linked with the original Expo repository, use the following commands:
- `git remote add upstream https://github.com/expo/expo.git`
- `git fetch upstream`
- `git checkout -b upstream-main upstream/main`

Then, to create a split branch with only code from `expo-image-picker`, use the following:
- `git branch upstream-image-picker && git filter-repo --refs upstream-image-picker --path packages/expo-image-picker/ --path-rename packages/expo-image-picker/: --force`
- `git checkout upstream-image-picker`

You may need to `brew install git-filter-repo` if you don't have filter-repo installed already.