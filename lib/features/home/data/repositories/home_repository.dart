import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/constants/endpoints.dart';
import '../../../../core/constants/enums.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepo(Ref ref) => HomeRepository(ref);

class HomeRepository {
  HomeRepository(this.ref);
  final Ref ref;

  Future<bool> getHomeState() async {
    final response = await ref
        .read(apiServiceProvider)
        .get(endpoint: Endpoints.home);

    final HomeScreenEnum state = HomeScreenEnum.fromJsonKey(response['state']);

    switch(state){
      case HomeScreenEnum.actionRequired:
        return
    }
   
  }
}
