// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingDataState)
final onboardingDataStateProvider = OnboardingDataStateProvider._();

final class OnboardingDataStateProvider
    extends $NotifierProvider<OnboardingDataState, OnboardingDataModel> {
  OnboardingDataStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingDataStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingDataStateHash();

  @$internal
  @override
  OnboardingDataState create() => OnboardingDataState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingDataModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingDataModel>(value),
    );
  }
}

String _$onboardingDataStateHash() =>
    r'9660c06542dbdb971842c031f7cbef9e1a7a1d1e';

abstract class _$OnboardingDataState extends $Notifier<OnboardingDataModel> {
  OnboardingDataModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OnboardingDataModel, OnboardingDataModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingDataModel, OnboardingDataModel>,
              OnboardingDataModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
