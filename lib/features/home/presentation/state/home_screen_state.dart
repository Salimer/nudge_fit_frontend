import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/home_screen_model.dart';
import '../../data/repositories/home_repository.dart';

part 'home_screen_state.g.dart';

@riverpod
FutureOr<HomeScreenModel> homeScreenState(Ref ref) async {
  return await ref.read(homeRepoProvider).getHomeState();
  // return HomeScreenEnum.setupRequired;
}
