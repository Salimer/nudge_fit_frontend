import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @nudgeFit.
  ///
  /// In en, this message translates to:
  /// **'Nudge Fit'**
  String get nudgeFit;

  /// No description provided for @weDoOnlyOneThing.
  ///
  /// In en, this message translates to:
  /// **'We do only one thing:'**
  String get weDoOnlyOneThing;

  /// No description provided for @makeSureYouShowUp.
  ///
  /// In en, this message translates to:
  /// **'Make sure you show up'**
  String get makeSureYouShowUp;

  /// No description provided for @youHaveThePlanWeProvideTheDiscipline.
  ///
  /// In en, this message translates to:
  /// **'You have the plan.\nWe provide the decipline.'**
  String get youHaveThePlanWeProvideTheDiscipline;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @whyDoYouUsuallySkip.
  ///
  /// In en, this message translates to:
  /// **'Why do you usually skip?'**
  String get whyDoYouUsuallySkip;

  /// No description provided for @feelsLikeAChore.
  ///
  /// In en, this message translates to:
  /// **'Feels like a chore'**
  String get feelsLikeAChore;

  /// No description provided for @ateTooMuch.
  ///
  /// In en, this message translates to:
  /// **'Ate too much'**
  String get ateTooMuch;

  /// No description provided for @tooStressed.
  ///
  /// In en, this message translates to:
  /// **'Too stressed'**
  String get tooStressed;

  /// No description provided for @wokeUpLateAndRushed.
  ///
  /// In en, this message translates to:
  /// **'Woke up late & rushed'**
  String get wokeUpLateAndRushed;

  /// No description provided for @notEnoughTime.
  ///
  /// In en, this message translates to:
  /// **'Not enough time'**
  String get notEnoughTime;

  /// No description provided for @isNotFunAnymore.
  ///
  /// In en, this message translates to:
  /// **'Is not fun anymore'**
  String get isNotFunAnymore;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @whenAreWeDoingThis.
  ///
  /// In en, this message translates to:
  /// **'When are we doing this?'**
  String get whenAreWeDoingThis;

  /// No description provided for @workoutDays.
  ///
  /// In en, this message translates to:
  /// **'Workout days'**
  String get workoutDays;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @questionMark.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get questionMark;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @pmLabel.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pmLabel;

  /// No description provided for @amLabel.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get amLabel;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// No description provided for @commitmentTitle.
  ///
  /// In en, this message translates to:
  /// **'THE COMMITMENT.'**
  String get commitmentTitle;

  /// No description provided for @commitmentBody.
  ///
  /// In en, this message translates to:
  /// **'We provide the discipline. That means we will nudge you before your workout, and nag you incessantly after your start time until you show up.'**
  String get commitmentBody;

  /// No description provided for @nudgeFriendly.
  ///
  /// In en, this message translates to:
  /// **'Friendly Nudge (30 mins before)'**
  String get nudgeFriendly;

  /// No description provided for @nudgeLate.
  ///
  /// In en, this message translates to:
  /// **'Late Nag (15 mins after)'**
  String get nudgeLate;

  /// No description provided for @nudgePersistent.
  ///
  /// In en, this message translates to:
  /// **'Persistent Nags (until you finish)'**
  String get nudgePersistent;

  /// No description provided for @btnUnderstandNag.
  ///
  /// In en, this message translates to:
  /// **'I UNDERSTAND. NAG ME.'**
  String get btnUnderstandNag;

  /// No description provided for @btnMaybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get btnMaybeLater;

  /// No description provided for @excuseAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Excuse already exists'**
  String get excuseAlreadyExists;

  /// No description provided for @at.
  ///
  /// In en, this message translates to:
  /// **'at'**
  String get at;

  /// No description provided for @holdToSeal.
  ///
  /// In en, this message translates to:
  /// **'Hold to Seal'**
  String get holdToSeal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
