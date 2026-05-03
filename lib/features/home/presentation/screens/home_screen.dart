import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/enums.dart';
import '../state/home_screen_state.dart';
import '../views/action_required_view.dart';
import '../views/completed_view.dart';
import '../views/rest_day_view.dart';
import '../views/setup_required_view.dart';
import '../views/skipped_view.dart';

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
            child: homeScreenState.when(
              data: (state) {
                switch (state) {
                  case HomeScreenEnum.setupRequired:
                    return SetupRequiredView();
                  case HomeScreenEnum.restDay:
                    return RestDayView();
                  case HomeScreenEnum.actionRequired:
                    return ActionRequiredView();
                  case HomeScreenEnum.completed:
                    return CompletedView();
                  case HomeScreenEnum.skipped:
                    return SkippedView();
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
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        );
      },
    );
  }
}
