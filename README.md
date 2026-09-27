# Privacy Policy

A Flutter app for reading the privacy policy and warranty information for
StefanRonnkvist.com. The policy is bundled with the app and does not require an
account or sign-in.

## Features

- Focused, scrollable privacy policy with a visible effective date
- Help tab explaining app navigation, policy scope, third-party services, and
	policy updates
- Responsive, width-constrained layout for phones and larger displays
- Animated launch screen
- Android, iOS, web, Windows, macOS, and Linux Flutter targets

This app is a policy viewer. It does not generate privacy policies or provide
legal advice.

## Requirements

- Flutter with a Dart SDK compatible with `^3.12.2`
- Platform toolchains for each target you intend to build
- A configured Android signing key for Android release builds

Check the local environment and install dependencies:

```powershell
flutter doctor
flutter pub get
```

## Run and verify

```powershell
flutter run
flutter analyze
```

Choose a target explicitly when more than one device is available:

```powershell
flutter run -d windows
flutter run -d chrome
```

## Release builds

The VS Code task `Build All Release Targets` bumps the version and builds the
APK, Android App Bundle, web app, Windows app, and MSIX package in sequence.
Individual Flutter builds can also be created directly:

```powershell
flutter build apk --release
flutter build appbundle --release
flutter build web --release
flutter build windows --release
dart run msix:create --build-windows=false
```

Release version values are maintained in `pubspec.yaml`. The MSIX version in
`msix_config` must remain a four-part equivalent of the Flutter package
version.

## Project layout

- `lib/main.dart` configures and starts the Material app.
- `lib/splash_screen.dart` contains the launch sequence and home navigation.
- `lib/privacypolicy.dart` owns the displayed policy content and layout.
- `lib/help_tab.dart` contains the in-app help content.
- `store_listing/` contains English store metadata ready for release portals.

## Store publishing

Review the files under `store_listing/en-US` before each submission. Add the
final support URL, privacy-policy URL, screenshots, category, and required
store declarations directly in the relevant publishing portal; those values
are not guessed in this repository.
