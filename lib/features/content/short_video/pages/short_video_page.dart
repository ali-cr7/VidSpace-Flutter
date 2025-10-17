
import 'package:flutter/material.dart';
import '../widgets/short_video_tile.dart';

class ShortVideoPage extends StatelessWidget {
  const ShortVideoPage({super.key});

  static final List<Map<String, String>> _sample = [
    {'id': 's1', 'title': 'Quick Flutter Tip', 'author': 'DevGuru'},
    {'id': 's2', 'title': '30s Recipe Hack', 'author': 'KitchenLive'},
    {'id': 's3', 'title': 'Street Photography', 'author': 'PhotoFlow'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Shorts'),
        backgroundColor: Colors.black,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _sample.length,
        itemBuilder: (context, index) {
          final item = _sample[index];
          return ShortVideoTile(
            id: item['id']!,
            title: item['title']!,
            author: item['author']!,
          );
        },
      ),
    );
  }
}
