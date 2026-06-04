import 'dart:async';

import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/services/api_service.dart';
import '../../../../core/constants/endpoints.dart';
import '../../presentation/state/auth_token_state.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepo(Ref ref) => AuthRepository(ref);

class AuthRepository {
  final Ref ref;
  AuthRepository(this.ref);

  ApiService get _svc => ref.read(apiServiceProvider);

  Future authenticateWithGoogleToken({
    required String accessToken,
    required bool loginOrFail,
  }) async {
    final String endpoint = loginOrFail
        ? Endpoints.auth.googleLoginOrFail
        : Endpoints.auth.googleLoginOrCreate;

    final response = await _svc
        .post(body: {'access_token': accessToken}, endpoint: endpoint);

    ref.read(authTokenStateProvider.notifier).set(response['token']);
  }

  Future logout() async {
    await _svc.post(body: {}, endpoint: Endpoints.auth.logout);
  }

  Future<String> getGoogleAccessToken() async {
    const String iosClientId =
        '366691556307-rp12tbvigocn5aand8l71k8mb0a7qglg.apps.googleusercontent.com';
    const String webClientId =
        '366691556307-a8pkac5rsb3ur2mhok1353mbs74knc6m.apps.googleusercontent.com';
    // Your Google Sign-In Logic

    final GoogleSignIn signIn = GoogleSignIn.instance;

    // At the start of your app, initialize the GoogleSignIn instance
    unawaited(
      signIn.initialize(clientId: iosClientId, serverClientId: webClientId),
    );

    // Perform the sign in
    final googleAccount = await signIn.authenticate();

    const List<String> scopes = ['email', 'profile', 'openid'];

    final googleAuthorization = await googleAccount.authorizationClient
        .authorizationForScopes(scopes);
    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = googleAuthorization?.accessToken;

    if (idToken == null || accessToken == null) {
      throw 'No ID or access Token found from google.';
    }

    return accessToken;
  }
}
