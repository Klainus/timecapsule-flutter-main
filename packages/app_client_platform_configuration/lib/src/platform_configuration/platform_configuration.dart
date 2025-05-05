// Conditionally exports the correct platform configuration
// based on the platform.
// This ensures that dart:html is not imported on mobile
// and that dart:io is not imported on the web since doing so
// would prevent the app from compiling.

export 'package:app_client_platform_configuration/src/platform_configuration/stub_configuration.dart'
    if (dart.library.js_interop) 'package:app_client_platform_configuration/src/platform_configuration/web_configuration.dart'
    if (dart.library.io) 'package:app_client_platform_configuration/src/platform_configuration/mobile_configuration.dart';
