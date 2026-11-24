import 'package:flutter/material.dart';
import 'package:lessons3month/route/auto_router.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  static final _appRouter = AutoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Мои заметки',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      routerConfig: _appRouter.config(),
    );
  }
}
