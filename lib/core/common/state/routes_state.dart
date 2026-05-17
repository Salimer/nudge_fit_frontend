import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/contract/presentation/screens/contract_screen.dart';
import '../../../features/history/presentation/screens/history_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_7_seal_commitment_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_1_welcome_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_6_not_req_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_2_excuses_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_9_paywall_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_8_auth_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_3_contract_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_4_goals_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_5_battlefield_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';
import 'navigator_key_state.dart';

part 'routes_state.g.dart';

@Riverpod(keepAlive: true)
GoRouter routes(Ref ref) {
  return GoRouter(
    navigatorKey: ref.read(navigatorKeyStateProvider),
    initialLocation: '/home_screen',
    // initialLocation: '/onboarding_first',
    routes: [
      GoRoute(
        name: RouteNames.onboarding1Welcome,
        path: '/onboarding_first',
        pageBuilder: (context, state) {
          return _adaptivePageBuilder(state, const Onboarding1WelcomeScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.onboarding2Excuses,
            path: 'onboarding_second',
            pageBuilder: (context, state) {
              return _adaptivePageBuilder(
                state,
                const Onboarding2ExcusesScreen(),
              );
            },
            routes: [
              GoRoute(
                name: RouteNames.onboarding3Contract,
                path: 'onboarding_third',
                pageBuilder: (context, state) {
                  return _adaptivePageBuilder(
                    state,
                    const Onboarding3ContractScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.onboarding4goals,
                    path: 'onboarding_fourth',
                    pageBuilder: (context, state) {
                      return _adaptivePageBuilder(
                        state,
                        const Onboarding4GoalsScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.onboarding5Battlefield,
                        path: 'onboarding_fifth',
                        pageBuilder: (context, state) {
                          return _adaptivePageBuilder(
                            state,
                            const Onboarding5BattlefieldScreen(),
                          );
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.onboarding6NotReq,
                            path: 'onboarding_sixth',
                            pageBuilder: (context, state) {
                              return _adaptivePageBuilder(
                                state,
                                const Onboarding6NotReqScreen(),
                              );
                            },
                            routes: [
                              GoRoute(
                                name: RouteNames.onboarding7SealCommitment,
                                path: 'onboarding_seventh',
                                pageBuilder: (context, state) {
                                  return _adaptivePageBuilder(
                                    state,
                                    const Onboarding7SealCommitmentScreen(),
                                  );
                                },
                                routes: [
                                  GoRoute(
                                    name: RouteNames.onboarding8Auth,
                                    path: 'onboarding_eighth',
                                    pageBuilder: (context, state) {
                                      return _adaptivePageBuilder(
                                        state,
                                        const Onboarding8AuthScreen(),
                                      );
                                    },
                                    routes: [
                                      GoRoute(
                                        name: RouteNames.onboarding9Paywall,
                                        path: 'onboarding_ninth',
                                        pageBuilder: (context, state) {
                                          return _adaptivePageBuilder(
                                            state,
                                            const Onboarding9PaywallScreen(),
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
  static const onboarding1Welcome = 'onBorading';
  static const onboarding2Excuses = 'onBoradingSecond';
  static const onboarding3Contract = 'onBoradingThird';
  static const onboarding4goals = 'onBoradingFourth';
  static const onboarding5Battlefield = 'onBoradingFifth';
  static const onboarding6NotReq = 'onBoradingSixth';
  static const onboarding7SealCommitment = 'onBoradingSeventh';
  static const onboarding8Auth = 'onBoradingEighth';
  static const onboarding9Paywall = 'onBoradingNinth';
  static const homeScreen = 'homeScreen';
  static const settings = 'settings';
  static const history = 'history';
  static const profile = 'profile';
  static const contract = 'contract';
}
