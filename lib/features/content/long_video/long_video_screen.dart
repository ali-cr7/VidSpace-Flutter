import 'package:flutter/material.dart';
import 'package:youtube_clone/features/content/long_video/parts/long_video_post.dart';

class LongVideoScreen extends StatelessWidget {
  const LongVideoScreen({super.key});

  final List<Map<String, dynamic>> _samplePosts = const [
    {
      'id': '1',
      'title': 'Relaxing Nature Walk',
      'author': 'NatureChannel',
      'views': '1.2M',
      'duration': '18:42',
      'thumbnail': null,
      'description': 'A calm nature walk with beautiful scenery.',
    },
    {
      'id': '2',
      'title': 'Deep Dive into Flutter Widgets',
      'author': 'DevGuru',
      'views': '320K',
      'duration': '24:10',
      'thumbnail': null,
      'description': 'Learn how widgets compose and render in Flutter.',
    },
    {
      'id': '3',
      'title': 'Cooking: Classic Pasta',
      'author': 'KitchenLive',
      'views': '210K',
      'duration': '12:03',
      'thumbnail': null,
      'description': 'Simple step-by-step pasta recipe.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Videos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _samplePosts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final post = _samplePosts[index];
          return LongVideoPost(
            id: post['id'] as String,
            title: post['title'] as String,
            author: post['author'] as String,
            views: post['views'] as String,
            duration: post['duration'] as String,
            description: post['description'] as String,
          );
        },
      ),
    );
  }
}
