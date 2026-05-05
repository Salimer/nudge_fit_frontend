import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator_key_state.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKeyState(Ref ref) {
  return GlobalKey<NavigatorState>();
}
