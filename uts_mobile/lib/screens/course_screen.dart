import 'package:flutter/material.dart';
import 'learning_screen.dart';

class CoursesScreen extends StatelessWidget {
  // Data dummy untuk daftar course
  final List<Map<String, String>> myCourses = [
    {
      'title': 'Forex Trading Basics',
      'description': 'Learn the basics of forex trading.',
      'status': 'In Progress',
    },
    {
      'title': 'Advanced Forex Strategies',
      'description': 'Master advanced trading strategies.',
      'status': 'Completed',
    },
    {
      'title': 'Risk Management',
      'description': 'Understand how to manage your trading risks.',
      'status': 'Not Started',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Menentukan warna utama berdasarkan tema
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 112, 50, 163),
          flexibleSpace: Center(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              child: Text(
                'My Courses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        color: isDarkMode ? Colors.grey[850] : const Color.fromARGB(255, 245, 245, 245),
        child: ListView.builder(
          itemCount: myCourses.length,
          itemBuilder: (context, index) {
            final course = myCourses[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  // Navigasi ke halaman pembelajaran
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LearningPage(
                        title: course['title'] ?? '',
                        description: course['description'] ?? '',
                        status: course['status'] ?? '',
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    // Sampul kursus di sebelah kiri
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.network(
                        'https://via.placeholder.com/100',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Detail kursus di sebelah kanan
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['title'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color.fromARGB(255, 112, 50, 163),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              course['description'] ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                color: isDarkMode ? Colors.white70 : Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Status: ${course['status'] ?? ''}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: course['status'] == 'Completed'
                                    ? Colors.green
                                    : course['status'] == 'In Progress'
                                        ? Colors.orange
                                        : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
