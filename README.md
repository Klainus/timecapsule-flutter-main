# 🏠 App Shack Flutter Template 

App Shack's template app for Flutter projects

[![Flutter CI](https://github.com/app-shack/as-boilerplate-flutter/actions/workflows/main.yaml/badge.svg)](https://github.com/app-shack/as-boilerplate-flutter/actions/workflows/main.yaml)
[![codecov](https://codecov.io/gh/app-shack/as-boilerplate-flutter/branch/main/graph/badge.svg?token=lixwdyr0TA)](https://codecov.io/gh/app-shack/as-boilerplate-flutter)

## Gettig started

There are a couple of things in the project that needs to be configured when you start using this boilerplate. Follow the steps below, and when done, you remove this section.

Steps:

- [ ] Update the `README.md` file.
  - Update title at the top.
  - Update the badges for CI and Codecov.
    - **CI**: Go to the `Actions` tab, select your main CI flow, click on the meatball menu at the right, and select `Create status badge`. 
    - **Codecov**: Login to Codecov, find your repository, and generate a new badge link.
- [ ] Update Bundle ID (iOS) and Package Name (Android).
- [ ] Update the Sentry DSN in the [error_tracking](https://github.com/app-shack/as-boilerplate-flutter/blob/main/packages/error_tracking/lib/src/error_tracking.dart) package.

## Running the app
Read this doccument if you have trouble running the app.

[Running the app guide](doc/running_the_app.md)

## CI/CD 🏎️
This project comes with Continuous Integration and Distribution using Codemagic. 

[Continuous Integration and Distribution guide](doc/continous_integration.md)

## Generating api

This project uses OpenApi generator to automatically build the api layer from BEs openAI documentation.
For mor information, read the generation docs: 

[OpenApi Generation guide](doc/api_generation.md)

## Flutter Gen
This project uses Flutter Gen to generate Assets.  

[Flutter Gen guide](doc/flutter_gen.md)



