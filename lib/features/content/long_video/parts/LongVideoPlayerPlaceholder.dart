import 'package:flutter/material.dart';

class LongVideoPlayerPlaceholder extends StatefulWidget {
  const LongVideoPlayerPlaceholder({super.key, this.duration});

  final String? duration;

  @override
  State<LongVideoPlayerPlaceholder> createState() => _LongVideoPlayerPlaceholderState();
}

class _LongVideoPlayerPlaceholderState extends State<LongVideoPlayerPlaceholder> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.grey.shade900),
          Center(
            child: IconButton(
              iconSize: 56,
              color: Colors.white70,
              icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
              onPressed: () => setState(() => _isPlaying = !_isPlaying),
            ),
          ),
          if (widget.duration != null)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
                child: Text(widget.duration!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ),
            ),
        ],
      ),
    );
  }
}