import 'package:flutter/material.dart';
import 'course_detail_page.dart'; // Import halaman CourseDetailPage

class SearchScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                'Search',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField untuk pencarian kursus
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 112, 50, 163)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 112, 50, 163)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Daftar Kursus
            const Text(
              'Available Courses',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 112, 50, 163),
              ),
            ),
            const SizedBox(height: 16.0),

            // Daftar Kursus (List)
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Tentukan jumlah kursus
                itemBuilder: (context, index) {
                  return CourseCard(
                    courseName: 'Course Name ${index + 1}',
                    imageUrl: 'https://via.placeholder.com/100',
                    courseDescription: 'This is the description for course ${index + 1}.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailPage(
                            courseName: 'Course Name ${index + 1}',
                            courseDescription: 'This is the description for course ${index + 1}.',
                            imageUrl: '',
                            course: {},
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String imageUrl;
  final String courseDescription;
  final VoidCallback onTap;

  CourseCard({
    required this.courseName,
    required this.imageUrl,
    required this.courseDescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          courseName,
          style: TextStyle(
            fontSize: 16, // Ukuran font untuk nama kursus
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 112, 50, 163), // Warna ungu sesuai tema
          ),
        ),
        subtitle: Text(
          courseDescription,
          style: TextStyle(
            fontSize: 14, // Ukuran font untuk deskripsi kursus
            color: Colors.grey[600], // Warna abu-abu untuk deskripsi
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 112, 50, 163)),
        onTap: onTap,
      ),
    );
  }
}

