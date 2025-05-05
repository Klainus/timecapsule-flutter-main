// ignore_for_file: cascade_invocations

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

void addPlatformConfiguration(Dio dio, CookieJar cookieJar) {
  final adapter = BrowserHttpClientAdapter();
  // Sends credentials such as cookies or authorization headers for
  // cross-site requests. I.e. this is needed for cookies to work on web.
  adapter.withCredentials = true;
  dio.httpClientAdapter = adapter;
}
