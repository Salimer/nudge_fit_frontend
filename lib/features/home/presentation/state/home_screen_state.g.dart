// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeScreenState)
final homeScreenStateProvider = HomeScreenStateProvider._();

final class HomeScreenStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeScreenModel>,
          HomeScreenModel,
          FutureOr<HomeScreenModel>
        >
    with $FutureModifier<HomeScreenModel>, $FutureProvider<HomeScreenModel> {
  HomeScreenStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeScreenStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeScreenStateHash();

  @$internal
  @override
  $FutureProviderElement<HomeScreenModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeScreenModel> create(Ref ref) {
    return homeScreenState(ref);
  }
}

String _$homeScreenStateHash() => r'd881a33d5c6453ff80e29c01861761d4c9ed2c0c';
