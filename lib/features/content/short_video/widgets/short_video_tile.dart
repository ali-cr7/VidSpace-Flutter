// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class ShortVideoTile extends StatefulWidget {
  const ShortVideoTile({
    super.key,
    required this.id,
    required this.title,
    required this.author,
  });

  final String id;
  final String title;
  final String author;

  @override
  State<ShortVideoTile> createState() => _ShortVideoTileState();
}

class _ShortVideoTileState extends State<ShortVideoTile> {
  bool _isLiked = false;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final youtubeRed = const Color(0xFFFF0000);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.grey.shade900),
        GestureDetector(
          onTap: () => setState(() => _isPlaying = !_isPlaying),
          child: Center(
            child: Icon(
              _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              size: 72,
              color: Colors.white70,
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 24,
          right: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.author,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        Positioned(
          right: 12,
          bottom: 24,
          child: Column(
            children: [
              IconButton(
                onPressed: () => setState(() => _isLiked = !_isLiked),
                icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                color: _isLiked ? youtubeRed : Colors.white70,
              ),
              const SizedBox(height: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment),
                color: Colors.white70,
              ),
              const SizedBox(height: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
