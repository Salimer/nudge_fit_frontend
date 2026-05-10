import 'dart:async';

import 'package:flutter/material.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';

import '../data/repositories/auth_repository.dart';

part 'auth_use_case.g.dart';

@Riverpod(keepAlive: true)
AuthUseCase authUseCase(Ref ref) => AuthUseCase(ref);

class AuthUseCase {
  final Ref ref;
  AuthUseCase(this.ref);

  AuthRepository get authRepo => ref.read(authRepoProvider);

  Future googleSignIn() async {
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
    final googleAuthorization = await googleAccount.authorizationClient
        .authorizationForScopes([]);
    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = googleAuthorization?.accessToken;

    // debugPrint(idToken);
    // debugPrint(accessToken);

    if (idToken == null || accessToken == null) {
      throw 'No ID Token found.';
    }

    await ref
        .read(authRepoProvider)
        .googleSignIn(accessToken: accessToken, idToken: idToken);
  }
}

final signInMutation = Mutation<void>(label: 'sign In');
