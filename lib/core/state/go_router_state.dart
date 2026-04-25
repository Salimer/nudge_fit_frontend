import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

part 'go_router_state.g.dart';

@Riverpod(keepAlive: true)
GoRouter routes(Ref ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(
            state,
            OnboardingScreen(),
          );
        },
      ),
    ],
  );
}

Page<void> _adaptivePageBuilder(GoRouterState state, Widget child) {
  return Platform.isIOS
      ? CupertinoPage(child: child, key: state.pageKey)
      : MaterialPage(child: child, key: state.pageKey);
}

class RouteNames {
  static const onboarding = 'onBorading';
}
