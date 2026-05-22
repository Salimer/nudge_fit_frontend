import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/constants/endpoints.dart';

part 'notification_repository.g.dart';

@Riverpod(keepAlive: true)
NotificationRepository notificationRepo(Ref ref) => NotificationRepository(ref);

class NotificationRepository {
  final Ref ref;
  NotificationRepository(this.ref);

  Future syncFcmToken(String token) async {
    await ref
        .read(apiServiceProvider)
        .post(body: {'fcm_token': token}, endpoint: Endpoints.fcmToken);
  }
}
