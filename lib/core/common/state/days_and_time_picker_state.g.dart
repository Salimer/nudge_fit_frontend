// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_and_time_picker_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DaysAndTimePickerState)
final daysAndTimePickerStateProvider = DaysAndTimePickerStateProvider._();

final class DaysAndTimePickerStateProvider
    extends $NotifierProvider<DaysAndTimePickerState, DaysAndTimePickerModel> {
  DaysAndTimePickerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'daysAndTimePickerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$daysAndTimePickerStateHash();

  @$internal
  @override
  DaysAndTimePickerState create() => DaysAndTimePickerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DaysAndTimePickerModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DaysAndTimePickerModel>(value),
    );
  }
}

String _$daysAndTimePickerStateHash() =>
    r'3cda72bf509c985e79f4ef7dd07d6f302caa86fc';

abstract class _$DaysAndTimePickerState
    extends $Notifier<DaysAndTimePickerModel> {
  DaysAndTimePickerModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<DaysAndTimePickerModel, DaysAndTimePickerModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DaysAndTimePickerModel, DaysAndTimePickerModel>,
              DaysAndTimePickerModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
