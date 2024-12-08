import 'package:flutter/material.dart';
import 'cart_page.dart'; // Import halaman cart jika sudah dibuat

class CourseDetailPage extends StatelessWidget {
  final String courseName;
  final String imageUrl;

  CourseDetailPage({required this.courseName, required this.imageUrl, required Map<String, String> course, required String courseDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar dengan gambar sampul dan teks putih
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 112, 50, 163),
            iconTheme: IconThemeData(color: Colors.white), // Menambahkan warna putih untuk tombol "back"
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                courseName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten detail kursus
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'About this Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 112, 50, 163),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This course provides in-depth knowledge and skills to master the topic. '
                    'You will learn from expert instructors and gain practical experience.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 112, 50, 163),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '- Expert-led video tutorials\n'
                    '- Comprehensive study materials\n'
                    '- Quizzes and assignments for hands-on practice\n'
                    '- Certificate of completion',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  // Tombol untuk membeli
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 112, 50, 163),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
