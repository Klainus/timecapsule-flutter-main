import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sv.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sv')
  ];

  /// Text shown in the appbar of the landing page
  ///
  /// In sv, this message translates to:
  /// **'App Shack'**
  String get landingPageTitle;

  /// Text shown in the navigation for the home page
  ///
  /// In sv, this message translates to:
  /// **'Hem'**
  String get navigationHome;

  /// Text shown in the navigation for the settings page
  ///
  /// In sv, this message translates to:
  /// **'Inställningar'**
  String get navigationSettings;

  /// Text shown in the appbar of the settings page
  ///
  /// In sv, this message translates to:
  /// **'Inställningar'**
  String get settingsPageTitle;

  /// Title for the theme settings
  ///
  /// In sv, this message translates to:
  /// **'Tema'**
  String get settingsThemeTitle;

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In sv, this message translates to:
  /// **'App Shack'**
  String get counterAppBarTitle;

  /// Text shown when a general server error occurs
  ///
  /// In sv, this message translates to:
  /// **'Något gick fel.'**
  String get generalServerError;

  /// Text shown in the appbar back button
  ///
  /// In sv, this message translates to:
  /// **'Tillbaka'**
  String get backButtonText;

  /// Text shown when no results are found
  ///
  /// In sv, this message translates to:
  /// **'Hittade inga resultat.'**
  String get noResults;

  /// Text shown when the email field is empty
  ///
  /// In sv, this message translates to:
  /// **'E-postadressen får inte vara tom.'**
  String get emailEmpty;

  /// Text shown in the create account action
  ///
  /// In sv, this message translates to:
  /// **'Skapa konto'**
  String get createAccountAction;

  /// Text shown in the appbar of the create account page
  ///
  /// In sv, this message translates to:
  /// **'Skapa konto'**
  String get createAccountPageTitle;

  /// Text shown as a subtitle on the create account page
  ///
  /// In sv, this message translates to:
  /// **'Fyll i dina uppgifter för att skapa ett konto.'**
  String get createAccountSubtitle;

  /// Text shown on the create account button
  ///
  /// In sv, this message translates to:
  /// **'Skapa konto'**
  String get createAccountButton;

  /// Text shown as the label for the email input
  ///
  /// In sv, this message translates to:
  /// **'Email'**
  String get emailLabelText;

  /// Text shown as the label for the password input
  ///
  /// In sv, this message translates to:
  /// **'Password'**
  String get passwordLabelText;

  /// Text shown as the title for the password criteria
  ///
  /// In sv, this message translates to:
  /// **'Lösenordet måste innehålla:'**
  String get passwordCriteriaTitle;

  /// Text shown as the character password criteria
  ///
  /// In sv, this message translates to:
  /// **'Minst 8 tecken'**
  String get passwordCriteriaCharacters;

  /// Text shown as the letter password criteria
  ///
  /// In sv, this message translates to:
  /// **'Minst 1 bokstav'**
  String get passwordCriteriaLetter;

  /// Text shown as the number password criteria
  ///
  /// In sv, this message translates to:
  /// **'Minst 1 siffra'**
  String get passwordCriteriaNumber;

  /// Text shown as the first part of the policy links info
  ///
  /// In sv, this message translates to:
  /// **'Genom att registrera dig godkänner du våra '**
  String get policyLinksInfoPart1;

  /// Text shown as the second part of the policy links info
  ///
  /// In sv, this message translates to:
  /// **' och '**
  String get policyLinksInfoPart2;

  /// Text shown as the terms policy link
  ///
  /// In sv, this message translates to:
  /// **'villkor'**
  String get policyLinksTerms;

  /// Text shown as the data handling policy link
  ///
  /// In sv, this message translates to:
  /// **'datahanteringspolicy'**
  String get policyLinksDataHandling;

  /// Text shown in the login action
  ///
  /// In sv, this message translates to:
  /// **'Logga in'**
  String get loginAction;

  /// Text shown in the appbar of the login page
  ///
  /// In sv, this message translates to:
  /// **'Logga in'**
  String get loginPageTitle;

  /// Text shown as the call to action for the login form
  ///
  /// In sv, this message translates to:
  /// **'Logga in'**
  String get loginFormCallToAction;

  /// Text shown when the credentials are invalid
  ///
  /// In sv, this message translates to:
  /// **'Felaktig e-post eller lösenord.'**
  String get invalidCredentials;

  /// Text shown when the email is unverified
  ///
  /// In sv, this message translates to:
  /// **'E-postadressen är inte verifierad.'**
  String get emailUnverified;

  /// Text shown when the password field is empty
  ///
  /// In sv, this message translates to:
  /// **'Lösenordet får inte vara tomt.'**
  String get passwordEmpty;

  /// No description provided for @enableAnalyticsTitle.
  ///
  /// In sv, this message translates to:
  /// **'Hjälp oss förbättra appen'**
  String get enableAnalyticsTitle;

  /// No description provided for @enableAnalyticsSubtitle.
  ///
  /// In sv, this message translates to:
  /// **'Tillåt oss att samla och analysera data så vi kan förbättra appen.'**
  String get enableAnalyticsSubtitle;

  /// No description provided for @enableAnalyticsAction.
  ///
  /// In sv, this message translates to:
  /// **'Aktivera datainsamling'**
  String get enableAnalyticsAction;

  /// No description provided for @skipAnalyticsAction.
  ///
  /// In sv, this message translates to:
  /// **'Hoppa över'**
  String get skipAnalyticsAction;

  /// No description provided for @logOutAction.
  ///
  /// In sv, this message translates to:
  /// **'Logga ut'**
  String get logOutAction;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'sv': return AppLocalizationsSv();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
