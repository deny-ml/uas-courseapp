import 'package:flutter/material.dart';
import 'course_detail_page.dart'; // Import halaman CourseDetailPage

class CategoryCoursesPage extends StatelessWidget {
  final String category;

  CategoryCoursesPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Daftar kursus berdasarkan kategori
    final List<Map<String, String>> courses = _getCoursesByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Courses'),
        backgroundColor: Color.fromARGB(255, 112, 50, 163),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail kursus
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(
                    courseName: courses[index]['title']!,
                    imageUrl: 'https://via.placeholder.com/150', // URL gambar, bisa diganti
                    course: courses[index], courseDescription: '',
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(courses[index]['title']!),
                subtitle: Text(courses[index]['description']!),
              ),
            ),
          );
        },
      ),
    );
  }

  // Mengambil kursus berdasarkan kategori
  List<Map<String, String>> _getCoursesByCategory(String category) {
    // Contoh data kursus, Anda bisa mengganti ini dengan data dari API atau database
    final courses = {
      'Web Development': [
        {'title': 'HTML & CSS', 'description': 'Learn web development basics.'},
        {'title': 'JavaScript for Beginners', 'description': 'Intro to JavaScript.'},
      ],
      'Mobile Development': [
        {'title': 'Flutter for Beginners', 'description': 'Learn Flutter framework.'},
        {'title': 'React Native', 'description': 'Learn cross-platform app development.'},
      ],
      'Data Science': [
        {'title': 'Python for Data Science', 'description': 'Learn data science with Python.'},
        {'title': 'Machine Learning', 'description': 'Introduction to ML concepts.'},
      ],
      // Tambahkan kategori lain di sini
    };

    return courses[category] ?? [];
  }
}
