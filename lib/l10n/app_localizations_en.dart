// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get nudgeFit => 'Nudge Fit';

  @override
  String get weDoOnlyOneThing => 'We do only one thing:';

  @override
  String get makeSureYouShowUp => 'Make sure you show up';

  @override
  String get youHaveThePlanWeProvideTheDiscipline =>
      'You have the plan.\nWe provide the decipline.';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get getStarted => 'Get Started';

  @override
  String get whyDoYouUsuallySkip => 'Why do you usually skip?';

  @override
  String get feelsLikeAChore => 'Feels like a chore';

  @override
  String get ateTooMuch => 'Ate too much';

  @override
  String get tooStressed => 'Too stressed';

  @override
  String get wokeUpLateAndRushed => 'Woke up late & rushed';

  @override
  String get notEnoughTime => 'Not enough time';

  @override
  String get isNotFunAnymore => 'Is not fun anymore';

  @override
  String get other => 'Other';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get whenAreWeDoingThis => 'When are we doing this?';

  @override
  String get workoutDays => 'Workout days';

  @override
  String get startTime => 'Start Time';

  @override
  String get questionMark => '?';

  @override
  String get hours => 'hours';

  @override
  String get minutes => 'minutes';

  @override
  String get pmLabel => 'PM';

  @override
  String get amLabel => 'AM';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get saturday => 'Sat';

  @override
  String get sunday => 'Sun';

  @override
  String get monday => 'Mon';

  @override
  String get tuesday => 'Tue';

  @override
  String get wednesday => 'Wed';

  @override
  String get thursday => 'Thu';

  @override
  String get friday => 'Fri';

  @override
  String get commitmentTitle => 'THE COMMITMENT.';

  @override
  String get commitmentBody =>
      'We provide the discipline. That means we will nudge you before your workout, and nag you incessantly after your start time until you show up.';

  @override
  String get nudgeFriendly => 'Friendly Nudge (30 mins before)';

  @override
  String get nudgeLate => 'Late Nag (15 mins after)';

  @override
  String get nudgePersistent => 'Persistent Nags (until you finish)';

  @override
  String get btnUnderstandNag => 'I UNDERSTAND. NAG ME.';

  @override
  String get btnMaybeLater => 'Maybe later';

  @override
  String get excuseAlreadyExists => 'Excuse already exists';

  @override
  String get at => 'at';

  @override
  String get holdToSeal => 'Hold to Seal';

  @override
  String get contractSealed => 'CONTRACT SEALED.';

  @override
  String get createAccountText =>
      'Create your account to save your schedule and unleash Mighty.';

  @override
  String get signInWithApple => 'Sign In with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String paywallHeader(Object name) {
    return 'Max your accountability, $name.';
  }

  @override
  String get tierFreeTitle => 'FREE';

  @override
  String get tierFreeSub => '(BASIC NAGS)';

  @override
  String get freeFeature1 => 'Fixed weekly plan';

  @override
  String get freeFeature2 => 'Non-editable mid-week';

  @override
  String get freeFeature3 => 'Standard AI prompts';

  @override
  String get tierPremiumTitle => 'PREMIUM';

  @override
  String get tierPremiumSub => '(YOUR COACH)';

  @override
  String get premiumFeature1 => 'Mid-week plan edits';

  @override
  String get premiumFeature2 => 'Retroactive log editing';

  @override
  String get premiumFeature3 => 'Hyper-personalized AI nudges';

  @override
  String get trialText => 'Start with a 7-day free trial.';

  @override
  String get btnUpgrade => 'TRY 7 DAYS FREE & UPGRADE';

  @override
  String get btnContinueFree => 'Continue with Free (limited) plan';

  @override
  String get streak => 'Streak';

  @override
  String get section1 => '// Home Setup Required';

  @override
  String homeSetupGreeting(Object name) {
    return 'Hi $name, we\'re missing something...';
  }

  @override
  String get homeSetupTitle => 'CONTRACT REQUIRED.';

  @override
  String get homeSetupDaysLabel => 'Workout Days:';

  @override
  String get homeSetupTimeLabel => 'Start Time:';

  @override
  String get homeSetupBtn => 'CREATE THE CONTRACT';

  @override
  String get section2 => '// Home Rest Day';

  @override
  String homeRestGreeting(Object name) {
    return 'Hi $name,';
  }

  @override
  String get homeRestTitle => 'ENJOY YOUR REST.';

  @override
  String get homeRestLabel => 'Rest Day.';

  @override
  String get homeRestBody =>
      'Mighty is recharging. Make sure you do too.\n\nYour body needs to recover.';

  @override
  String get daysStrong => 'days strong';

  @override
  String get section3 => '// Home Action Required';

  @override
  String get homeActionTitle => 'WORKOUT DAY.';

  @override
  String get homeContractLabel => 'TODAY\'S CONTRACT';

  @override
  String homeContractTime(Object time) {
    return 'Scheduled: $time';
  }

  @override
  String get homeContractStatusPending => 'Status: Active (Nudges Pending)';

  @override
  String get btnStarted => 'I STARTED MY WORKOUT';

  @override
  String get btnSkip => 'Skip Today';

  @override
  String get actionAnticipationMsg =>
      'Mighty is ready and waiting. Don\'t make him start nagging.';

  @override
  String get section4 => '// Home Completed';

  @override
  String homeCompletedGreeting(Object name) {
    return 'Contract Met, $name!';
  }

  @override
  String get homeCompletedTitle => 'DAY CONQUERED.';

  @override
  String homeCompletedBody(Object nextDay) {
    return 'Discipline Activated. Rest up for $nextDay.';
  }

  @override
  String homeCompletedStatus(Object day) {
    return '$day CONTRACT SEALED.';
  }

  @override
  String homeSkippedGreeting(Object name) {
    return 'Hi $name, let\'s look at why you skipped.';
  }

  @override
  String get homeSkippedTitle => 'DAY FAILED.';

  @override
  String get homeLoggedLabel => 'EXCUSE LOGGED';

  @override
  String homeLoggedExcuse(Object excuse) {
    return 'Excuse: $excuse';
  }

  @override
  String get homeLoggedStatusSkipped => 'Status: Skipped';

  @override
  String get homeSkippedNudge =>
      'You broke your contract. Remember the feeling so you don\'t skip again!';
}
