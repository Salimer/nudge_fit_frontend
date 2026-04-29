import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger_key_state.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(Ref ref) {
  return GlobalKey<ScaffoldMessengerState>();
}
