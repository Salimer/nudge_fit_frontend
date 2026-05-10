import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/contract/presentation/screens/contract_screen.dart';
import '../../../features/history/presentation/screens/history_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_fifth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_first_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_fourth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_second_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_seventh_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_sixth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_third_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';
import 'navigator_key_state.dart';

part 'routes_state.g.dart';

@Riverpod(keepAlive: true)
GoRouter routes(Ref ref) {
  return GoRouter(
    navigatorKey: ref.read(navigatorKeyStateProvider),
    // initialLocation: '/home_screen',
    initialLocation: '/onboarding_first',
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding_first',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(state, const OnboardingFirstScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.onboardingSecond,
            path: 'onboarding_second',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(
                state,
                const OnboardingSecondScreen(),
              );
            },
            routes: [
              GoRoute(
                name: RouteNames.onboardingThird,
                path: 'onboarding_third',
                pageBuilder: (context, state) {
                  return _adaptivePageBuilder(
                    state,
                    const OnboardingThirdScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.onboardingFourth,
                    path: 'onboarding_fourth',
                    pageBuilder: (context, state) {
                      return _adaptivePageBuilder(
                        state,
                        const OnboardingFourthScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.onboardingFifth,
                        path: 'onboarding_fifth',
                        pageBuilder: (context, state) {
                          return _adaptivePageBuilder(
                            state,
                            const OnboardingFifthScreen(),
                          );
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.onboardingSixth,
                            path: 'onboarding_sixth',
                            pageBuilder: (context, state) {
                              return _adaptivePageBuilder(
                                state,
                                const OnboardingSixthScreen(),
                              );
                            },
                            routes: [
                              GoRoute(
                                name: RouteNames.onboardingSeventh,
                                path: 'onbaording_seventh',
                                pageBuilder: (context, state) {
                                  return _adaptivePageBuilder(
                                    state,
                                    const OnboardingSeventhScreen(),
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
          return _adaptivePageBuilder(state, const HomeScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.settings,
            path: 'settings',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, const SettingsScreen());
            },
          ),
          GoRoute(
            name: RouteNames.history,
            path: 'history',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, const HistoryScreen());
            },
          ),
          GoRoute(
            name: RouteNames.profile,
            path: 'profile',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, const ProfileScreen());
            },
          ),
          GoRoute(
            name: RouteNames.contract,
            path: 'contract',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(state, const ContractScreen());
            },
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
  static const onboardingFifth = 'onBoradingFifth';
  static const onboardingSixth = 'onBoradingSixth';
  static const onboardingSeventh = 'onbaordingSeventh';
  static const homeScreen = 'homeScreen';
  static const settings = 'settings';
  static const history = 'history';
  static const profile = 'profile';
  static const contract = 'contract';
}
