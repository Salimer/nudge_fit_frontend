// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeUseCase)
final homeUseCaseProvider = HomeUseCaseProvider._();

final class HomeUseCaseProvider
    extends $FunctionalProvider<HomeUseCase, HomeUseCase, HomeUseCase>
    with $Provider<HomeUseCase> {
  HomeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeUseCaseHash();

  @$internal
  @override
  $ProviderElement<HomeUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeUseCase create(Ref ref) {
    return homeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeUseCase>(value),
    );
  }
}

String _$homeUseCaseHash() => r'c054b10eea6f99df0718b58c48618be3bd35a9c3';
