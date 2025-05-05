#!/bin/bash

for config in Debug-development Profile-development Release-development; 
do
  flutterfire config \
    --project=boilerplate-dev-f79bb \
    --platforms=ios,android,web \
    --out=lib/firebase_options_dev.dart \
    --ios-bundle-id=se.appshack.asboilerplateflutter.dev \
    --ios-out=ios/flavors/dev/GoogleService-Info.plist \
    --android-package-name=se.appshack.asboilerplateflutter.dev \
    --android-out=android/app/src/development/google-services.json \
    --ios-build-config=$config
done

for config in Debug-production Profile-production Release-production;
do
  flutterfire config \
    --project=boilerplate-76495 \
    --platforms=ios,android,web \
    --ios-bundle-id=se.appshack.asboilerplateflutter \
    --ios-out=ios/Runner/GoogleService-Info.plist \
    --android-package-name=se.appshack.asboilerplateflutter \
    --android-out=android/app/google-services.json \
    --ios-build-config=$config
done