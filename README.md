# Campus Coach Session Application

**Campus Coach Session** is a Flutter mobile application designed to serve as a foundation for managing campus coaching sessions.
This repository contains the full source code with proper architecture, asset organization, and code generation setup.

## Demo video included in the repo

---

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Technical Details](#technical-details)
* [Getting Started](#getting-started)
* [Code Generation](#code-generation)
* [Running the App](#running-the-app)
* [Testing](#testing)

---

## Overview

This project is a Flutter application that demonstrates:

* Structured project setup with assets and mock data.
* Use of **GetX** as state management, mandatory for the exercise.
* Use of **Freezed** for immutable data classes and `json_serializable` for JSON parsing.
* Integration with **Firebase** for backend features such as crash reporting.
* Use of **flex_color_scheme** for theme management and features.
* Organized Flutter project structure suitable for building scalable mobile apps.

It serves as a starting point for development, testing, and technical evaluation.

---

## Features

* Campus Coach Session provides a clear and structured view of campus sport sessions, intended for athletes, students, and coaches. Each session is presented in a detailed layout, divided into three main sections:

* Header and Stats: Displays the session title, date, and time. Shows key metrics with a global description of the session.
* Exercises Details: Lists all exercises included in the session and describe all rep and blocks details with time and pace.
* Coach profile and advices.

---

## Technical Details

* **Framework & Language:** Flutter & Dart
* **State / Navigation:** ([GetX](https://pub.dev/packages/get)) package
* **Code Generation:** `freezed`, `json_serializable`, `build_runner`
* **Firebase:** `firebase_core`, `firebase_crashlytics`
* **UI & Theming:** `flex_color_scheme`, Material Design widgets
* **Logger:** `logger` package for structured debug output

**Key Choices:**

* **Freezed + json_serializable:** Ensures immutable models and safe JSON parsing.
* **GetX:** Lightweight state management and navigation solution.
* **FlexColorScheme:** Provides an easy way to define consistent theming across the app.
* **Firebase Crashlytics:** Tracks runtime errors in production.

---

## Getting Started

### Prerequisites

* Flutter SDK ([Install Guide](https://docs.flutter.dev/get-started/install))
* Dart (included with Flutter)
* Git

### Clone & Install

```bash
git clone https://github.com/Hoardon/application_campus_coach_session.git
cd application_campus_coach_session
flutter pub get
```

---

## Code Generation (Freezed & JSON)

Since the project uses **Freezed** and **json_serializable**, generated code must be created before running the app:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

* Use `watch` for continuous code generation during development:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## Running the App

To run on a connected device or emulator:

```bash
flutter run
```

Build APK for Android:

```bash
flutter build apk
```

Build for iOS:

```bash
flutter build ios
```

---

## Testing

Run all tests in the `test` folder:

```bash
flutter test
```

---

This repository provides a clean, ready-to-use Flutter app setup with **Freezed**, **Firebase**, and proper project structure — ideal for development, evaluation, and technical testing.
