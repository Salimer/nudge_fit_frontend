// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingUseCase)
final onboardingUseCaseProvider = OnboardingUseCaseProvider._();

final class OnboardingUseCaseProvider
    extends
        $FunctionalProvider<
          OnboardingUseCase,
          OnboardingUseCase,
          OnboardingUseCase
        >
    with $Provider<OnboardingUseCase> {
  OnboardingUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingUseCaseHash();

  @$internal
  @override
  $ProviderElement<OnboardingUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingUseCase create(Ref ref) {
    return onboardingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingUseCase>(value),
    );
  }
}

String _$onboardingUseCaseHash() => r'b10889e9d4c7d17b948a9c5f0994117fee1f63b3';
