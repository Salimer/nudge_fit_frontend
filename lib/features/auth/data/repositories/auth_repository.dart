import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/constants/endpoints.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepo(Ref ref) => AuthRepository(ref);

class AuthRepository {
  final Ref ref;
  AuthRepository(this.ref);

  Future googleSignIn({
    required String accessToken,
    required String idToken,
  }) async {
    await ref
        .read(apiServiceProvider)
        .post(
          body: {'id_token': idToken, 'access_token': accessToken},
          endpoint: Endpoints.googleSignIn,
        );
  }
}
