import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/enums.dart';
import '../../../core/utils/get_localized_day.dart';
import '../data/repositories/home_repository.dart';

part 'home_use_case.g.dart';

@Riverpod(keepAlive: true)
HomeUseCase homeUseCase(Ref ref) => HomeUseCase(ref);

class HomeUseCase {
  HomeUseCase(this.ref);
  final Ref ref;

  String localizedDay(String day) {
    return getLocalizedDay(ref, day);
  }
}
