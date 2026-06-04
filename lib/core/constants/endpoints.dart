class Endpoints {
  static const onboarding = 'onboarding';
  static const home = 'home';
  static const fcmToken = 'user/fcm_token';

  static const auth = _AuthEndpoints();
}

class _AuthEndpoints {
  const _AuthEndpoints();

  final googleLoginOrCreate = 'auth/google';
  final googleLoginOrFail = 'auth/google/login';
  final logout = 'auth/logout';
}
