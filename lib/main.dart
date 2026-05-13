import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/common/state/locale_state.dart';
import 'features/auth/presentation/state/auth_token_state.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(retry: (retryCount, error) => null);
  await container.read(localeStateProvider.future);
  await container.read(authTokenStateProvider.future);
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}
