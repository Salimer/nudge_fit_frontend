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
          AsyncValue<HomeScreenEnum>,
          HomeScreenEnum,
          FutureOr<HomeScreenEnum>
        >
    with $FutureModifier<HomeScreenEnum>, $FutureProvider<HomeScreenEnum> {
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
  $FutureProviderElement<HomeScreenEnum> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeScreenEnum> create(Ref ref) {
    return homeScreenState(ref);
  }
}

String _$homeScreenStateHash() => r'15df551f44f07fd098e649b2bac5ed1758aa5326';
