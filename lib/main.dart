import 'package:flutter/material.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/core/state/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appState = await AppState.create();
  runApp(const TodoApp());
}
