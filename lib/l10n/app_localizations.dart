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

  /// No description provided for @contractSealed.
  ///
  /// In en, this message translates to:
  /// **'CONTRACT SEALED.'**
  String get contractSealed;

  /// No description provided for @createAccountText.
  ///
  /// In en, this message translates to:
  /// **'Create your account to save your schedule and unleash Mighty.'**
  String get createAccountText;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Apple'**
  String get signInWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @paywallHeader.
  ///
  /// In en, this message translates to:
  /// **'Max your accountability, {name}.'**
  String paywallHeader(Object name);

  /// No description provided for @tierFreeTitle.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get tierFreeTitle;

  /// No description provided for @tierFreeSub.
  ///
  /// In en, this message translates to:
  /// **'(BASIC NAGS)'**
  String get tierFreeSub;

  /// No description provided for @freeFeature1.
  ///
  /// In en, this message translates to:
  /// **'Fixed weekly plan'**
  String get freeFeature1;

  /// No description provided for @freeFeature2.
  ///
  /// In en, this message translates to:
  /// **'Non-editable mid-week'**
  String get freeFeature2;

  /// No description provided for @freeFeature3.
  ///
  /// In en, this message translates to:
  /// **'Standard AI prompts'**
  String get freeFeature3;

  /// No description provided for @tierPremiumTitle.
  ///
  /// In en, this message translates to:
  /// **'PREMIUM'**
  String get tierPremiumTitle;

  /// No description provided for @tierPremiumSub.
  ///
  /// In en, this message translates to:
  /// **'(YOUR COACH)'**
  String get tierPremiumSub;

  /// No description provided for @premiumFeature1.
  ///
  /// In en, this message translates to:
  /// **'Mid-week plan edits'**
  String get premiumFeature1;

  /// No description provided for @premiumFeature2.
  ///
  /// In en, this message translates to:
  /// **'Retroactive log editing'**
  String get premiumFeature2;

  /// No description provided for @premiumFeature3.
  ///
  /// In en, this message translates to:
  /// **'Hyper-personalized AI nudges'**
  String get premiumFeature3;

  /// No description provided for @trialText.
  ///
  /// In en, this message translates to:
  /// **'Start with a 7-day free trial.'**
  String get trialText;

  /// No description provided for @btnUpgrade.
  ///
  /// In en, this message translates to:
  /// **'TRY 7 DAYS FREE & UPGRADE'**
  String get btnUpgrade;

  /// No description provided for @btnContinueFree.
  ///
  /// In en, this message translates to:
  /// **'Continue with Free (limited) plan'**
  String get btnContinueFree;

  /// No description provided for @streak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get streak;

  /// No description provided for @section1.
  ///
  /// In en, this message translates to:
  /// **'// Home Setup Required'**
  String get section1;

  /// No description provided for @homeSetupGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi {name}, we\'re missing something...'**
  String homeSetupGreeting(Object name);

  /// No description provided for @homeSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'CONTRACT REQUIRED.'**
  String get homeSetupTitle;

  /// No description provided for @homeSetupDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Workout Days:'**
  String get homeSetupDaysLabel;

  /// No description provided for @homeSetupTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Start Time:'**
  String get homeSetupTimeLabel;

  /// No description provided for @homeSetupBtn.
  ///
  /// In en, this message translates to:
  /// **'CREATE THE CONTRACT'**
  String get homeSetupBtn;

  /// No description provided for @section2.
  ///
  /// In en, this message translates to:
  /// **'// Home Rest Day'**
  String get section2;

  /// No description provided for @homeRestGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi {name},'**
  String homeRestGreeting(Object name);

  /// No description provided for @homeRestTitle.
  ///
  /// In en, this message translates to:
  /// **'ENJOY YOUR REST.'**
  String get homeRestTitle;

  /// No description provided for @homeRestLabel.
  ///
  /// In en, this message translates to:
  /// **'Rest Day.'**
  String get homeRestLabel;

  /// No description provided for @homeRestBody.
  ///
  /// In en, this message translates to:
  /// **'Mighty is recharging. Make sure you do too.\n\nYour body needs to recover.'**
  String get homeRestBody;

  /// No description provided for @daysStrong.
  ///
  /// In en, this message translates to:
  /// **'days strong'**
  String get daysStrong;

  /// No description provided for @section3.
  ///
  /// In en, this message translates to:
  /// **'// Home Action Required'**
  String get section3;

  /// No description provided for @homeActionTitle.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT DAY.'**
  String get homeActionTitle;

  /// No description provided for @homeContractLabel.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S CONTRACT'**
  String get homeContractLabel;

  /// No description provided for @homeContractTime.
  ///
  /// In en, this message translates to:
  /// **'Scheduled: {time}'**
  String homeContractTime(Object time);

  /// No description provided for @homeContractStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Status: Active (Nudges Pending)'**
  String get homeContractStatusPending;

  /// No description provided for @btnStarted.
  ///
  /// In en, this message translates to:
  /// **'I STARTED MY WORKOUT'**
  String get btnStarted;

  /// No description provided for @btnSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip Today'**
  String get btnSkip;

  /// No description provided for @actionAnticipationMsg.
  ///
  /// In en, this message translates to:
  /// **'Mighty is ready and waiting. Don\'t make him start nagging.'**
  String get actionAnticipationMsg;

  /// No description provided for @section4.
  ///
  /// In en, this message translates to:
  /// **'// Home Completed'**
  String get section4;

  /// No description provided for @homeCompletedGreeting.
  ///
  /// In en, this message translates to:
  /// **'Contract Met, {name}!'**
  String homeCompletedGreeting(Object name);

  /// No description provided for @homeCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'DAY CONQUERED.'**
  String get homeCompletedTitle;

  /// No description provided for @homeCompletedBody.
  ///
  /// In en, this message translates to:
  /// **'Discipline Activated. Rest up for {nextDay}.'**
  String homeCompletedBody(Object nextDay);

  /// No description provided for @homeCompletedStatus.
  ///
  /// In en, this message translates to:
  /// **'{day} CONTRACT SEALED.'**
  String homeCompletedStatus(Object day);

  /// No description provided for @homeSkippedGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi {name}, let\'s look at why you skipped.'**
  String homeSkippedGreeting(Object name);

  /// No description provided for @homeSkippedTitle.
  ///
  /// In en, this message translates to:
  /// **'DAY FAILED.'**
  String get homeSkippedTitle;

  /// No description provided for @homeLoggedLabel.
  ///
  /// In en, this message translates to:
  /// **'EXCUSE LOGGED'**
  String get homeLoggedLabel;

  /// No description provided for @homeLoggedExcuse.
  ///
  /// In en, this message translates to:
  /// **'Excuse: {excuse}'**
  String homeLoggedExcuse(Object excuse);

  /// No description provided for @homeLoggedStatusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Status: Skipped'**
  String get homeLoggedStatusSkipped;

  /// No description provided for @homeSkippedNudge.
  ///
  /// In en, this message translates to:
  /// **'You broke your contract. Remember the feeling so you don\'t skip again!'**
  String get homeSkippedNudge;

  /// No description provided for @goalsPrompt.
  ///
  /// In en, this message translates to:
  /// **'What are we fighting for?'**
  String get goalsPrompt;

  /// No description provided for @goalsPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'To build discipline for my business'**
  String get goalsPlaceholder;

  /// No description provided for @goalsBuildDiscipline.
  ///
  /// In en, this message translates to:
  /// **'To build discipline'**
  String get goalsBuildDiscipline;

  /// No description provided for @goalsLoseWeight.
  ///
  /// In en, this message translates to:
  /// **'To lose weight'**
  String get goalsLoseWeight;

  /// No description provided for @goalsGainMuscle.
  ///
  /// In en, this message translates to:
  /// **'To gain muscle'**
  String get goalsGainMuscle;

  /// No description provided for @goalsFeelBetter.
  ///
  /// In en, this message translates to:
  /// **'To feel better'**
  String get goalsFeelBetter;

  /// No description provided for @battlefieldPrompt.
  ///
  /// In en, this message translates to:
  /// **'How are we training?'**
  String get battlefieldPrompt;

  /// No description provided for @battlefieldStyle.
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get battlefieldStyle;

  /// No description provided for @battlefieldStyleHome.
  ///
  /// In en, this message translates to:
  /// **'Home Strength'**
  String get battlefieldStyleHome;

  /// No description provided for @battlefieldStyleGym.
  ///
  /// In en, this message translates to:
  /// **'Full Gym'**
  String get battlefieldStyleGym;

  /// No description provided for @battlefieldStyleCalisthenics.
  ///
  /// In en, this message translates to:
  /// **'Calisthenics'**
  String get battlefieldStyleCalisthenics;

  /// No description provided for @battlefieldEquipment.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get battlefieldEquipment;

  /// No description provided for @battlefieldEquipmentDumbbells.
  ///
  /// In en, this message translates to:
  /// **'Dumbbells'**
  String get battlefieldEquipmentDumbbells;

  /// No description provided for @battlefieldEquipmentBodyweight.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight'**
  String get battlefieldEquipmentBodyweight;

  /// No description provided for @battlefieldEquipmentFull.
  ///
  /// In en, this message translates to:
  /// **'Full Equipment'**
  String get battlefieldEquipmentFull;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @problemOccurred.
  ///
  /// In en, this message translates to:
  /// **'Sorry, there is a problem'**
  String get problemOccurred;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;
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
