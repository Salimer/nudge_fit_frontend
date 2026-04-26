import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/onboarding/presentation/screens/onboarding_first_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_second_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_third_screen.dart';

part 'go_router_state.g.dart';

@Riverpod(keepAlive: true)
GoRouter routes(Ref ref) {
  return GoRouter(
    initialLocation: '/onboarding-first',
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding-first',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(state, OnboardingFirstScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.onboardingSecond,
            path: 'onboarding-second',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, OnboardingSecondScreen());
            },
            routes: [
              GoRoute(
                name: RouteNames.onboardingThird,
                path: 'onboarding-third',
                pageBuilder: (context, state) {
                  return _adaptivePageBuilder(state, OnboardingThirdScreen());
                },
                routes: [
                  GoRoute(
                    name: RouteNames.onboardingFourth,
                    path: 'onboarding-fourth',
                    pageBuilder: (context, state) {
                      return _adaptivePageBuilder(
                        state,
                        OnboardingFourthScreen(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
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
  static const onboardingSecond = 'onBoradingSecond';
  static const onboardingThird = 'onBoradingThird';
  static const onboardingFourth = 'onBoradingFourth';
}
