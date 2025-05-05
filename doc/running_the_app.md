
# How to get the app running

## Config options

- [Very Good CLI](https://pub.dev/packages/very_good_cli) - Highly recommended

- [FVM](https://fvm.app)

- [Melos](https://melos.invertase.dev)

## Getting packages 📦
To run ```flutter pub get``` in all packages:

1. Install [Very Good CLI](https://pub.dev/packages/very_good_cli)

2. Run the following command:

```sh
$ very_good packages get -r
```

## Running App 🚀

Run the app:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Running Tests 🧪

To run all tests:

1. Install [Very Good CLI](https://pub.dev/packages/very_good_cli)

2. Run the following command:

```sh
$ very_good test -r
```

To run tests for the package in the current directory and view the coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
$ flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
```

---