import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lessons3month/model/note.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  bool get _canSave =>
      _titleController.text.trim().isNotEmpty &&
      _textController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (!_canSave) return;
    context.maybePop(
      Note(
        title: _titleController.text.trim(),
        text: _textController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новая заметка')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Заголовок',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Текст заметки',
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 5,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canSave ? _saveNote : null,
                child: const Text('Добавить заметку'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
