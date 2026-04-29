import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'home_screen_state.g.dart';

@riverpod
FutureOr<HomeScreenEnum> homeScreenState(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return HomeScreenEnum.skipped;
}
