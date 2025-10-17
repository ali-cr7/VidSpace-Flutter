import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Comment {
  Comment({
    required this.id,
    required this.author,
    required this.text,
    required this.timeAgo,
  });

  final String id;
  final String author;
  final String text;
  final String timeAgo;
}

class CommentProvider extends ChangeNotifier {
  CommentProvider() {
    _loadSample();
  }

  final List<Comment> _comments = [];

  List<Comment> get comments => List.unmodifiable(_comments);

  void _loadSample() {
    _comments.addAll([
      Comment(
        id: 'c1',
        author: 'ViewerOne',
        text: 'Nice video!',
        timeAgo: '2h',
      ),
      Comment(
        id: 'c2',
        author: 'UserTwo',
        text: 'Loved the tips.',
        timeAgo: '1d',
      ),
      Comment(
        id: 'c3',
        author: 'Alex',
        text: 'Great content — thanks!',
        timeAgo: '3d',
      ),
    ]);
    notifyListeners();
  }

  void addComment(String author, String text) {
    final newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      author: author,
      text: text,
      timeAgo: 'now',
    );
    _comments.insert(0, newComment);
    notifyListeners();
  }

  void clear() {
    _comments.clear();
    notifyListeners();
  }
}
