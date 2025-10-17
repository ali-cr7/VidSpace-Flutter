// ...existing code...
import 'package:flutter/material.dart';

class CommnetSheet extends StatefulWidget {
  const CommnetSheet({super.key, this.onSubmit});

  final void Function(String author, String text)? onSubmit;

  @override
  State<CommnetSheet> createState() => _CommnetSheetState();
}

class _CommnetSheetState extends State<CommnetSheet> {
  final TextEditingController _authorC = TextEditingController();
  final TextEditingController _textC = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _authorC.dispose();
    _textC.dispose();
    super.dispose();
  }

  void _send() {
    final author = _authorC.text.trim().isEmpty ? 'You' : _authorC.text.trim();
    final text = _textC.text.trim();
    if (text.isEmpty) return;
    setState(() => _sending = true);
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onSubmit?.call(author, text);
      setState(() => _sending = false);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add a comment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            TextField(
              controller: _authorC,
              decoration: const InputDecoration(
                labelText: 'Name (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _textC,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _sending ? null : _send,
                    child: _sending ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Post'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// ...existing code...