import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/spaces.dart';
import '../state/home_screen_state.dart';
import '../views/action_required_view.dart';
import '../views/completed_view.dart';
import '../views/rest_day_view.dart';
import '../views/setup_required_view.dart';
import '../views/skipped_view.dart';
import '../widgets/sheet_option_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final homeScreenState = ref.watch(homeScreenStateProvider);
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Stack(
              children: [
                homeScreenState.when(
                  data: (state) {
                    switch (state) {
                      case HomeScreenEnum.setupRequired:
                        return const SetupRequiredView();
                      case HomeScreenEnum.restDay:
                        return const RestDayView();
                      case HomeScreenEnum.actionRequired:
                        return const ActionRequiredView();
                      case HomeScreenEnum.completed:
                        return const CompletedView();
                      case HomeScreenEnum.skipped:
                        return const SkippedView();
                    }
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        error.toString(),
                        style: ShadTheme.of(context).textTheme.p,
                      ),
                    );
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                SafeArea(
                  child: Align(
                    alignment: const AlignmentDirectional(1, -1),
                    child: Padding(
                      padding: const EdgeInsets.all(Spaces.all),
                      child: ShadIconButton(
                        icon: const Icon(LucideIcons.menu),

                        onPressed: () {
                          showShadSheet(
                            context: context,
                            builder: (context) {
                              return ShadSheet(
                                useSafeArea: true,
                                title: const Text('Main Menu'),
                                scrollable: true,
                                draggable: true,
                                backgroundColor: ShadTheme.of(
                                  context,
                                ).colorScheme.muted,
                                closeIcon: const SizedBox.shrink(),
                                child: Column(
                                  spacing: Spaces.sm,
                                  children: [
                                    SheetOptionWidget(
                                      title: 'Settings',
                                      description: 'App preferences',
                                      icon: LucideIcons.settings,
                                      onTap: () {
                                        context.goNamed(RouteNames.settings);
                                      },
                                    ),
                                    SheetOptionWidget(
                                      title: 'Edit My Contract',
                                      description: 'Future Schedule Edits',
                                      icon: LucideIcons.handCoins,
                                      onTap: () {
                                        context.goNamed(RouteNames.contract);
                                      },
                                    ),
                                    SheetOptionWidget(
                                      title: 'History',
                                      description: 'Previous workouts',
                                      icon: LucideIcons.history,
                                      onTap: () {
                                        context.goNamed(RouteNames.history);
                                      },
                                    ),
                                    SheetOptionWidget(
                                      title: 'Profile',
                                      description: 'Goals, Tone & Context',
                                      icon: LucideIcons.user,
                                      onTap: () {
                                        context.goNamed(RouteNames.profile);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
