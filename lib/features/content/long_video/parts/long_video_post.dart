import 'package:flutter/material.dart';
import 'LongVideoPlayerPlaceholder.dart';
import '../widgets/video_externel_buttons.dart';
import '../widgets/video_first_comment.dart';

class LongVideoPost extends StatelessWidget {
  const LongVideoPost({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.views,
    required this.duration,
    required this.description,
  });

  final String id;
  final String title;
  final String author;
  final String views;
  final String duration;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LongVideoPlayerPlaceholder(duration: duration),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.grey.shade800,
                  child: Text(
                    author[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    author,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                Text(
                  '$views • $duration',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(color: Colors.white60)),
            const SizedBox(height: 10),
            VideoExternalButtons(likes: 1240, comments: 210, shareCount: 64),
            const Divider(color: Colors.white54),
            // const VideoFirstComment(
            //   author: 'Viewer123',
            //   avatarLetter: 'V',
            //   comment: 'Great video — learned a lot!',
            //   timeAgo: '2d',
            // ),
          ],
        ),
      ),
    );
  }
}
