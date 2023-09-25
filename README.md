# Omgiva

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## Prerequisites

This project assumes you are working on a Mac/Window/Linux OS.

## IDE

This has been primarily developed using [Android Studio](https://developer.android.com/studio),
although the
iOS-specific parts (like setting up Schemes) are done directly in XCode (Using
the `Flutter->Open iOS module in Xcode`
link in the Android Studio project menu dropdown).

## Keys

You will need to create a local keystore to sign android apps. Follow the instructions
at [https://flutter.dev/docs/deployment/android]

### Command:

```
flutter run lib/main.dart
flutter build apk
flutter build appbundle
flutter build ipa
```

--------------

## Repo management

Here are the list of points that needs to keep in my mind for repo management:

```
- Master is the main branch where all approved codes exist.
- All new branch needs to created from master for any new task.
- Branch name should contain 3 characters from developer name first.
- Branch name should contains the name of the feature or screen for connection. For ex: xxx/update_profile_screen, where xxx is developer's 3-char name.
- PR should be created by the developer worked on any specific task.
- Project manager / lead needs to check and verify that eveything is working fine as per the requirement in the task. After the PR can be approved and merged into the master branch.
```

--------------

## How to run the code

1. Make sure you have ios/android simulator tools installed , please look for resources mentioned in
   Getting started
   section for more details
2. Clone the repo
3. run - flutter packages get
4. run command from above
5. Make sure to atleast start Android / Ios simulator before running 'run' command

### Folder Structure

Here is the core folder structure which flutter provides.

```
aeo_box_demo_ui/
|- android
|- assets
|- ios
|- lib
|- test
```

Here is the core folder structure which flutter provides. TO-DO loading local fonts from assets
folder

```
assets/
|- fonts
|- icons
|- images
```

Here is the folder structure we have been using in this project

```
lib/
|-src/
  |-core/
    |-constants/
    |-helpers/
  |-presentation/
    |-views/
    |-widgets/
|- routes.dart
|- main.dart
```