import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../use_cases/auth_use_case.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool isAuthed = ref.read(authUseCaseProvider).isLoggedIn();
      if (isAuthed) {
        ref.read(routesProvider).goNamed(RouteNames.homeScreen);
      } else {
        ref.read(routesProvider).goNamed(RouteNames.onboarding1Welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
