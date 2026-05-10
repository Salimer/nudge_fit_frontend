// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_instance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioInstance)
final dioInstanceProvider = DioInstanceProvider._();

final class DioInstanceProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioInstanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioInstanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioInstanceHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioInstance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioInstanceHash() => r'dc7c52110bc291d1e1a3d2731a641f2ba7527dc4';
