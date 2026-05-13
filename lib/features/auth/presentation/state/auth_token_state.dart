import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/state/local_storage.dart';

part 'auth_token_state.g.dart';

@Riverpod(keepAlive: true)
class AuthTokenState extends _$AuthTokenState {
  @override
  FutureOr<String> build() async {
    await persist(
      ref.watch(localStorageProvider.future),
      key: 'auth_token',
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
      encode: (state) => state,
      decode: (value) => value,
    ).future;

    debugPrint('the token is: ${state.value}');

    return state.value ?? '';
  }

  void set(String token) => state = AsyncData(token);

  void clear() => state = const AsyncData('');

  String token() => state.value ?? '';

  bool hasToken() => state.value?.isNotEmpty ?? false;
}
