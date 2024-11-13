# Description

This is a fork of [`expo-image-picker`](https://www.npmjs.com/package/expo-image-picker) with additional utility as required by [swsh](https://www.joinswsh.com). Feel free to use at your own risk: This is considered to be very unstable and untested for most use cases.

Due to the monstrous size of Expo, this is a fork of a subdirectory in it so we don't have to download the entire repository. [Guide for forking and updating](https://stackoverflow.com/a/24577293)

<<<<<<< HEAD
To get a branch linked with the original Expo repository, use the following commands:
`git remote add upstream https://github.com/expo/expo.git`
`git fetch upstream`
`git checkout -b upstream-main upstream/main`
=======
- [Documentation for the latest stable release](https://docs.expo.dev/versions/latest/sdk/imagepicker/)
- [Documentation for the main branch](https://docs.expo.dev/versions/unversioned/sdk/imagepicker/)

# Installation in managed Expo projects

For [managed](https://docs.expo.dev/archive/managed-vs-bare/) Expo projects, please follow the installation instructions in the [API documentation for the latest stable release](https://docs.expo.dev/versions/latest/sdk/imagepicker/).

# Installation in bare React Native projects

For bare React Native projects, you must ensure that you have [installed and configured the `expo` package](https://docs.expo.dev/bare/installing-expo-modules/) before continuing.

### Add the package to your npm dependencies

```
npx expo install expo-image-picker
```

### Configure for Android

> This is only required for usage in bare React Native apps.

This package automatically adds the `CAMERA`, `READ_EXTERNAL_STORAGE`, and `WRITE_EXTERNAL_STORAGE` permissions. They are used when picking images from the camera directly, or from the camera roll.

```xml
<!-- Added permissions -->
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

### Configure for iOS

> This is only required for usage in bare React Native apps.

Add `NSPhotoLibraryUsageDescription`, `NSCameraUsageDescription`, and `NSMicrophoneUsageDescription` keys to your `Info.plist`:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to save photos</string>
<key>NSCameraUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to access your camera</string>
<key>NSMicrophoneUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to use your microphone</string>
```

Run `npx pod-install` after installing the npm package.

## Config Plugin

> This plugin is applied automatically in EAS Build, only add the config plugin if you want to pass in extra properties.

After installing this npm package, add the [config plugin](https://docs.expo.dev/config-plugins/introduction) to the [`plugins`](https://docs.expo.io/versions/latest/config/app/#plugins) array of your `app.json` or `app.config.js`:

```json
{
  "expo": {
    "plugins": ["expo-image-picker"]
  }
}
```

Next, rebuild your app as described in the ["Adding custom native code"](https://docs.expo.dev/workflow/customizing/) guide.

### API

The plugin provides props for extra customization. Every time you change the props or plugins, you'll need to rebuild (and `prebuild`) the native app. If no extra properties are added, defaults will be used.

- `photosPermission` (_string | false_): Sets the iOS `NSPhotoLibraryUsageDescription` permission message to the `Info.plist`. Setting `false` will skip adding the permission on iOS and **does not** skip the permission on Android. Defaults to `Allow $(PRODUCT_NAME) to access your photos`.
- `cameraPermission` (_string | false_): Sets the iOS `NSCameraUsageDescription` permission message to the `Info.plist`. Setting `false` will skip adding the permission on iOS and **does not** skip the permission on Android. Defaults to `Allow $(PRODUCT_NAME) to access your camera`.
- `microphonePermission` (_string | false_): Sets the iOS `NSCameraUsageDescription` permission message to the `Info.plist`. Setting `false` will skip adding the permission on iOS and skips adding the `android.permission.RECORD_AUDIO` Android permission. Defaults to `Allow $(PRODUCT_NAME) to access your photos`.

### Example

```json
{
  "expo": {
    "plugins": [
      [
        "expo-image-picker",
        {
          "photosPermission": "custom photos permission",
          "cameraPermission": "Allow $(PRODUCT_NAME) to open the camera",

          "//": "Disables the microphone permission",
          "microphonePermission": false
        }
      ]
    ]
  }
}
```

# Contributing

Contributions are very welcome! Please refer to guidelines described in the [contributing guide](https://github.com/expo/expo#contributing).
>>>>>>> upstream-expo-image-picker
