import 'package:flutter/material.dart';

class VideoExternalButtons extends StatelessWidget {
  const VideoExternalButtons({
    super.key,
    required this.likes,
    required this.comments,
    required this.shareCount,
  });

  final int likes;
  final int comments;
  final int shareCount;

  @override
  Widget build(BuildContext context) {
    final youtubeRed = const Color(0xFFFF0000);
    Widget btn(IconData icon, String label, VoidCallback onTap) =>
        TextButton.icon(
          onPressed: onTap,
          icon: Icon(icon, color: Colors.white70),
          label: Text(label, style: const TextStyle(color: Colors.white70)),
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          Row(
            children: [
              btn(Icons.thumb_up_alt_outlined, likes.toString(), () {}),
              btn(Icons.thumb_down_alt_outlined, 'Dislike', () {}),
              btn(Icons.comment_outlined, comments.toString(), () {}),
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.share, color: youtubeRed),
                label: const Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: youtubeRed.withOpacity(0.18),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download_outlined,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
