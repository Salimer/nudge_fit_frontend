import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/constants/endpoints.dart';
import '../../../../core/constants/enums.dart';
import '../models/home_screen_model.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepo(Ref ref) => HomeRepository(ref);

class HomeRepository {
  HomeRepository(this.ref);
  final Ref ref;

  Future<HomeScreenModel> getHomeState() async {
    final response = await ref
        .read(apiServiceProvider)
        .get(endpoint: Endpoints.home);

    final HomeScreenEnum state = HomeScreenEnum.fromJsonKey(response['state']);

    switch (state) {
      case HomeScreenEnum.actionRequired:
        return ActionRequiredModel.fromJson(response);
      case HomeScreenEnum.completed:
        return CompletedModel.fromJson(response);
      case HomeScreenEnum.setupRequired:
        return SetupRequiredModel.fromJson(response);
      case HomeScreenEnum.skipped:
        return SkippedModel.fromJson(response);
      case HomeScreenEnum.restDay:
        return RestDayModel.fromJson(response);
    }
  }
}
