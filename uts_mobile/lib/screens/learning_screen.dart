import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  final String title;
  final String description;
  final String status;

  LearningPage({
    required this.title,
    required this.description,
    required this.status,
  });

  // Data dummy untuk daftar video lanjutan
  final List<Map<String, String>> additionalVideos = [
    {'title': 'Video 1: Introduction', 'duration': '10:32'},
    {'title': 'Video 2: Key Concepts', 'duration': '15:45'},
    {'title': 'Video 3: Practical Examples', 'duration': '20:10'},
    {'title': 'Video 4: Advanced Techniques', 'duration': '12:00'},
    {'title': 'Video 5: Summary and Review', 'duration': '08:25'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 112, 50, 163),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tampilan layar video
          Container(
            height: 200,
            color: Colors.black,
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 64,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Detail video utama
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Video: $title',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 112, 50, 163),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Text(
                  'Status: $status',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: status == 'Completed'
                        ? Colors.green
                        : status == 'In Progress'
                            ? Colors.orange
                            : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32, thickness: 1),
          // Daftar video lanjutan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: additionalVideos.length,
                itemBuilder: (context, index) {
                  final video = additionalVideos[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.video_library,
                        color: Color.fromARGB(255, 112, 50, 163),
                      ),
                      title: Text(
                        video['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Duration: ${video['duration'] ?? ''}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        // Tambahkan navigasi jika diperlukan untuk memutar video lain
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Playing ${video['title']}',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
