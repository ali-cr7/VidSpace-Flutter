import 'package:flutter/material.dart';
import 'package:youtube_clone/core/widgets/flat_button.dart';

class UserChannelPage extends StatelessWidget {
  final String userId;
  const UserChannelPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  static const List<Map<String, String>> _sampleVideos = [
    {'id': 'v1', 'title': 'Relaxing Nature Walk'},
    {'id': 'v2', 'title': 'Flutter Widgets Deep Dive'},
    {'id': 'v3', 'title': 'Classic Pasta Recipe'},
    {'id': 'v4', 'title': 'City Timelapse'},
    {'id': 'v5', 'title': 'Quick Coding Tip'},
    {'id': 'v6', 'title': 'Photography Basics'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header (decorative background)
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.grey.shade900, Colors.black]),
                ),
                child: Center(
                  child: Text(
                    'Channel Banner',
                    style: TextStyle(color: Colors.white24, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Channel info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white54, size: 36),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Display Name",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "@username",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "0 subscriptions  •  0 videos",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FlatButton(
                  text: "SUBSCRIBE",
                  onPressed: () {},
                  colour: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Videos title
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Videos",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Grid of sample video thumbnails (UI only)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _sampleVideos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 16 / 9,
                  ),
                  itemBuilder: (context, index) {
                    final video = _sampleVideos[index];
                    return _VideoCard(title: video['title'] ?? '');
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  final String title;
  const _VideoCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Icon(Icons.play_circle_fill, color: Colors.white24, size: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}