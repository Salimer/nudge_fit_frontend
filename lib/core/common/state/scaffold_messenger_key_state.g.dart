// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_messenger_key_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scaffoldMessengerKey)
final scaffoldMessengerKeyProvider = ScaffoldMessengerKeyProvider._();

final class ScaffoldMessengerKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>
        >
    with $Provider<GlobalKey<ScaffoldMessengerState>> {
  ScaffoldMessengerKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerKeyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<ScaffoldMessengerState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<ScaffoldMessengerState> create(Ref ref) {
    return scaffoldMessengerKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<ScaffoldMessengerState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<ScaffoldMessengerState>>(
        value,
      ),
    );
  }
}

String _$scaffoldMessengerKeyHash() =>
    r'd312c68c939c6684184c4faa7e67434262f3aca9';
