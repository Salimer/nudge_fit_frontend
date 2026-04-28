import 'dart:ui';

import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'local_storage.dart';

part 'locale_state.g.dart';

@Riverpod(keepAlive: true)
class LocaleState extends _$LocaleState {
  @override
  FutureOr<Locale> build() async {
    final storageFuture = ref.watch(localStorageProvider.future);
    const String key = 'locale';

    await persist(
      storageFuture,
      key: key,
      options: const StorageOptions(
        cacheTime: StorageCacheTime.unsafe_forever,
        destroyKey: '1.0.0',
      ),
      encode: (state) => state.languageCode,
      decode: (value) => Locale(value),
    ).future;

    return state.value ??
        (PlatformDispatcher.instance.locale.languageCode == 'ar'
            ? Locale('ar')
            : Locale('en'));
}

  void changeLocale(String languageCode) {
    final code = languageCode == 'ar' ? 'ar' : 'en';
    state = AsyncValue.data(Locale(code));
  }
}
