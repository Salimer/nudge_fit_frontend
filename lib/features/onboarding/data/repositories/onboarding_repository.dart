import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/common/state/locale_state.dart';
import '../../../../core/constants/endpoints.dart';
import '../../presentation/state/onboarding_data_state.dart';

part 'onboarding_repository.g.dart';

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepo(Ref ref) => OnboardingRepository(ref);

class OnboardingRepository {
  final Ref ref;
  OnboardingRepository(this.ref);

  Future<void> onboard() async {
    await ref
        .read(apiServiceProvider)
        .post(
          body: {
            'locale': ref.read(localeStateProvider).requireValue.languageCode,
            'timezone': await getTimezone(),
            ...ref.read(onboardingDataStateProvider).toJson(),
          },
          endpoint: Endpoints.onboarding,
        );
  }

  Future<String> getTimezone() async {
    try {
      final TimezoneInfo currentTimezone =
          await FlutterTimezone.getLocalTimezone();
      return currentTimezone.identifier;
    } catch (e) {
      // FALLBACK: Construct a GMT offset string
      final duration = DateTime.now().timeZoneOffset;
      final hours = duration.inHours.abs().toString().padLeft(2, '0');
      final minutes = (duration.inMinutes.abs() % 60).toString().padLeft(
        2,
        '0',
      );
      final sign = duration.isNegative ? '-' : '+';

      // Returns something like "Etc/GMT+3" or "Etc/GMT-5"
      // Note: IANA 'Etc/GMT' signs are often inverted,
      // but most modern APIs prefer 'UTC+offset'
      return 'UTC$sign$hours:$minutes';
    }
  }
}
