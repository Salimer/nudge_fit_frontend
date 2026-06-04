// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthTokenState)
final authTokenStateProvider = AuthTokenStateProvider._();

final class AuthTokenStateProvider
    extends $AsyncNotifierProvider<AuthTokenState, String> {
  AuthTokenStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenStateHash();

  @$internal
  @override
  AuthTokenState create() => AuthTokenState();
}

String _$authTokenStateHash() => r'a95ceafdcf5510f613868eaa069ef0ee85500be7';

abstract class _$AuthTokenState extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
