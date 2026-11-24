import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lessons3month/model/note.dart';
import 'package:lessons3month/route/auto_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Note> _notes = [];

  Future<void> _addNote() async {
    final note = await context.pushRoute<Note>(const DetailRoute());
    if (!mounted || note == null) return;
    setState(() => _notes.add(note));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои заметки')),
      body: _notes.isEmpty
          ? const Center(child: Text('Пока нет заметок. Нажмите +, чтобы добавить.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _notes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.text),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Добавить заметку',
        child: const Icon(Icons.add),
      ),
    );
  }
}
