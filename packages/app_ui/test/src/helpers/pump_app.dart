import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    MockNavigator? navigator,
  }) async {
    await pumpWidget(
      MaterialApp(
        theme: const AppTheme.light().themeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: navigator == null
            ? Scaffold(
                body: widgetUnderTest,
              )
            : MockNavigatorProvider(
                navigator: navigator,
                child: Scaffold(
                  body: widgetUnderTest,
                ),
              ),
      ),
    );
    await pump();
  }

  Future<void> pumpAppWithContext(
    void Function(BuildContext) show, {
    ThemeData? theme,
    MockNavigator? navigator,
  }) async {
    final widget = Container();
    await pumpApp(widget);

    final context = element(
      find.byWidget(widget),
    );

    show(context);

    await pump();
  }
}
