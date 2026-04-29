import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_fifth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_first_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_fourth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_second_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_seventh_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_sixth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_third_screen.dart';

part 'routes_state.g.dart';

@Riverpod(keepAlive: true)
GoRouter routes(Ref ref) {
  return GoRouter(
    initialLocation: '/home_screen',
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding_first',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(state, OnboardingFirstScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.onboardingSecond,
            path: 'onboarding_second',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, OnboardingSecondScreen());
            },
            routes: [
              GoRoute(
                name: RouteNames.onboardingThird,
                path: 'onboarding_third',
                pageBuilder: (context, state) {
                  return _adaptivePageBuilder(state, OnboardingThirdScreen());
                },
                routes: [
                  GoRoute(
                    name: RouteNames.onboardingFourth,
                    path: 'onboarding_fourth',
                    pageBuilder: (context, state) {
                      return _adaptivePageBuilder(
                        state,
                        OnboardingFourthScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.onboardingFifth,
                        path: 'onboarding_fifth',
                        pageBuilder: (context, state) {
                          return _adaptivePageBuilder(
                            state,
                            OnboardingFifthScreen(),
                          );
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.onboardingSixth,
                            path: 'onboarding_sixth',
                            pageBuilder: (context, state) {
                              return _adaptivePageBuilder(
                                state,
                                OnboardingSixthScreen(),
                              );
                            },
                            routes: [
                              GoRoute(
                                name: RouteNames.onboardingSeventh,
                                path: 'onbaording_seventh',
                                pageBuilder: (context, state) {
                                  return _adaptivePageBuilder(
                                    state,
                                    OnboardingSeventhScreen(),
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
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.homeScreen,
        path: '/home_screen',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(state, HomeScreen());
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
  static const onboardingSecond = 'onBoradingSecond';
  static const onboardingThird = 'onBoradingThird';
  static const onboardingFourth = 'onBoradingFourth';
  static const onboardingFifth = 'onBoradingFifth';
  static const onboardingSixth = 'onBoradingSixth';
  static const onboardingSeventh = 'onbaordingSeventh';
  static const homeScreen = 'homeScreen';
}
