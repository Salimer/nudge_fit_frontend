import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';

import '../../../core/common/state/routes_state.dart';
import '../data/repositories/auth_repository.dart';
import '../presentation/state/auth_token_state.dart';

part 'auth_use_case.g.dart';

@Riverpod(keepAlive: true)
AuthUseCase authUseCase(Ref ref) => AuthUseCase(ref);

class AuthUseCase {
  final Ref ref;
  AuthUseCase(this.ref);

  AuthRepository get authRepo => ref.read(authRepoProvider);

  Future googleSignIn({required bool loginOrFail}) async {
    final accessToken = await ref.read(authRepoProvider).getGoogleAccessToken();

    await authRepo.authenticateWithGoogleToken(
      accessToken: accessToken,
      loginOrFail: loginOrFail,
    );
  }

  bool isLoggedIn() {
    return ref.read(authTokenStateProvider.notifier).hasToken();
  }

  bool isLoginRoute(GoRouterState state) {
    return state.name == RouteNames.login;
  }

  Future logout() async {
    // throw 'hi';
    await authRepo.logout();
    ref.read(authTokenStateProvider.notifier).clear();
    ref.read(routesProvider).go(RouteNames.onboarding1Welcome);
  }
}

final signInMutation = Mutation<void>(label: 'sign In');
