# Flutter Form Widget Demo

A simple Flutter app that demonstrates the `Form` widget with input validation.

## Features

- **Form** widget grouping fields, controlled by a `GlobalKey<FormState>`
- **Name** field — required
- **Email** field — must contain `@`
- **Submit** button that runs all validators and shows a greeting in a `SnackBar` when valid

## How It Works

1. `_formKey` gives access to the form's state.
2. Each `TextFormField` has a `validator` that returns an error message, or `null` if valid.
3. Pressing **Submit** calls `_formKey.currentState!.validate()`; if every field passes, a `SnackBar` says `Hello <name>!`.

## Getting Started

```bash
flutter pub get
flutter run
```

Main code: [lib/main.dart](lib/main.dart)
