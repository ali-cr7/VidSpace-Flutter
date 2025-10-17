import 'package:flutter/material.dart';

class VideoFirstComment extends StatelessWidget {
  const VideoFirstComment({
    super.key,
    required this.author,
    required this.avatarLetter,
    required this.comment,
    required this.timeAgo,
  });

  final String author;
  final String avatarLetter;
  final String comment;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade800, child: Text(avatarLetter, style: const TextStyle(color: Colors.white))),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(author, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Text('• $timeAgo', style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 4),
            Text(comment, style: const TextStyle(color: Colors.white70)),
          ]),
        ),
      ],
    );
  }
}