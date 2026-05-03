import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/core/common/state/routes_state.dart';

import '../common/state/navigator_key_state.dart';
import '../extensions/build_context.dart';

String getLocalizedDay(Ref ref, String day) {
  final locale = ref.read(navigatorKeyStateProvider).currentContext?.l10n;

  switch (day) {
    case "Saturday":
      return locale?.saturday ?? day;
    case "Sunday":
      return locale?.sunday ?? day;
    case "Monday":
      return locale?.monday ?? day;
    case "Tuesday":
      return locale?.tuesday ?? day;
    case "Wednesday":
      return locale?.wednesday ?? day;
    case "Thursday":
      return locale?.thursday ?? day;
    case "Friday":
      return locale?.friday ?? day;
    default:
      return day;
  }
}

List<String> getLocalizedDays(Ref ref, List<String> days) {
  return days.map((day) => getLocalizedDay(ref, day)).toList();
}
