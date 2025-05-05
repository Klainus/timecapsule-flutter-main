# Flutter Gen
This project uses Flutter Gen to generate Assets.  

There are a few benefits whith using this library: 
1. Type safety. Flutter Gen removes all string paths, meaning it's impossible to misspell an asset path and get a run time error.
2. Ease of use. Developers can use auto complete to get an overview of all available assets in a project.
3. Maintainability. Adding new assets is as easy as dropping them into the project and run the buildrunner. 
4. Refactoring. Changing a file name now show you all places in the code that has to be changed. 
5. Consistency. Forces all developers to use the same syntax when developing.

## Setup
The project is already set up to use flutter Gen. This was done by adding the following to pubspec.
```yaml
dev_dependencies:
  build_runner:
  flutter_gen_runner:
```

## Usage
Using the generated `Assets` class is simple. 
Simply call the Asset class and use code completion to find the file you want, then select what type of widget you want to build.

```dart
// Create an image
Assets.images.myPng.image();

// Create a provider
Assets.images.myPng.provider();

// Create an SVG
Assets.images.mySvg.svg();

// Get the path
Assets.images.myPng.path;
```

You can add all the parameters available for the native Image, Provider and Svg classes when creating an Asset, for example: 

```dart
Assets.images.myPng.image(
    width: 50,
    height: 70,
    color: Colors.blue
    fit: BoxFit.contain,
);
```  

The Assets class will mimic your asset file structure, so if you create sub-directories in your assets directory, the generated class will reflect this: 

```dart
// .
// ├── assets
//     ├── images
//         ├── background.png
//         ├── logos
//         │   ├── logo_1.png
//         │   └── logo_2.jpg
//         └── svg
//             └── logo_3.svg

// Get background asset
Assets.images.background

// Get logo_1 asset
Assets.images.logo.logo1

// Get logo_3 asset
Assets.images.svg.logo3

```

## Configuration
Flutter gen is configured in the pubspec file.  
Here is an example describing the different configuration options.

Configuration for root application pubspec.yaml
```yaml
# Configure Flutter Gen
flutter_gen:
  assets:
    # Enable asset generation
    enabled: true
  # Path where the output is generated
  output: lib/generated/
  # Maximum length allowed by project linting options
  line_length: 80
  integrations:
    # Enable svg support 
    flutter_svg: true
```

Configuration for packages imported by the root app:
```yaml
# Configure Flutter Gen
flutter_gen:
  assets:
    # Enable asset generation
    enabled: true
    outputs:
      # Allow generated file to be used outside of package
      package_parameter_enabled: true
  # Path where the output is generated
  output: lib/src/generated/
  # Maximum length allowed by project linting options
  line_length: 80
  integrations:
    # Enable svg support 
    flutter_svg: true
```  

For full configurations options, read the [pub dev documentation](https://pub.dev/packages/flutter_gen).  