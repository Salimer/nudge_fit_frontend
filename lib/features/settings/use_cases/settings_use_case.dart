import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/common/state/routes_state.dart';
import '../../auth/use_cases/auth_use_case.dart';

part 'settings_use_case.g.dart';

@Riverpod(keepAlive: true)
SettingsUseCase settingsUseCase(Ref ref) => SettingsUseCase(ref);

class SettingsUseCase {
  final Ref ref;
  SettingsUseCase(this.ref);

  Future logout() async {
    await ref.read(authUseCaseProvider).logout();
    ref.read(routesProvider).goNamed(RouteNames.onboarding1Welcome);
  }
}

final settingsMutation = Mutation<void>();
