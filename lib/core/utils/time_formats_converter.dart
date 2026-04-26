import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extensions/build_context.dart';

class TimeFormatsConverter {
  static String to24h(BuildContext context, TimeOfDay time) {
    final format = DateFormat.jm(context.l10n.localeName);
    return format.format(DateTime(2000, 1, 1, time.hour, time.minute));
  }

  static String to12h(BuildContext context, TimeOfDay time) {
    final format = DateFormat.jm(context.l10n.localeName);
    return format.format(DateTime(2000, 1, 1, time.hour, time.minute));
  }
}