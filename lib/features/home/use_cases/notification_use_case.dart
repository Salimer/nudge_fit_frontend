import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/common/services/notification_service.dart';
import '../data/repositories/notification_repository.dart';

part 'notification_use_case.g.dart';

@Riverpod(keepAlive: true)
NotificationUseCase notificationUseCase(Ref ref) => NotificationUseCase(ref);

class NotificationUseCase {
  final Ref ref;
  NotificationUseCase(this.ref);

  Future syncFcmToken() async {
    final token = await ref.read(notificationSvcProvider).getToken();
    if (token != null) {
      ref.read(notificationRepoProvider).syncFcmToken(token);
    }
  }
}
