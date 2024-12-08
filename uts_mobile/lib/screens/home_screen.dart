import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uts_mobile/screens/category_course_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 112, 50, 163),
          automaticallyImplyLeading: false,
          foregroundColor: const Color.fromARGB(255, 236, 236, 236),
          title: const Text(
            'KT Course',
            selectionColor: Color.fromARGB(255, 254, 254, 255),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PromoBanner(isLoading: false),
                const SizedBox(height: 20),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                ThinCategoryGrid(),
                const SizedBox(height: 20),
                Text(
                  'Recommended Courses',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                RecommendedCoursesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  final bool isLoading;

  PromoBanner({this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        : Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/promo_banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: const Text(
                'Learn Anytime, Anywhere\nUp to 50% Off!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}

class ThinCategoryGrid extends StatelessWidget {
  final List<String> categories = const [
    'Web Development',
    'Mobile Development',
    'Data Science',
    'AI',
    'Cloud Computing',
    'Cybersecurity',
    'UI/UX Design',
    'Digital Marketing',
  ];

  @override
  Widget build(BuildContext context) {
    // Periksa apakah tema aplikasi adalah dark atau light
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Warna tema aplikasi
    final backgroundColor = isDarkTheme
        ? Colors.black // Hitam untuk tema gelap
        : Colors.white; // Putih untuk tema terang
    final borderColor = Colors.purple; // Ungu untuk border
    final textColor = isDarkTheme
        ? Colors.white // Teks putih untuk tema gelap
        : Colors.purple; // Teks ungu untuk tema terang

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dua kolom
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 4, // Lebih tipis sesuai desain
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman kategori kursus
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CategoryCoursesPage(category: categories[index]),
              ),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}


class RecommendedCoursesList extends StatelessWidget {
  final List<Map<String, dynamic>> courses = const [
    {'title': 'Flutter Basics', 'image': 'assets/images/course_flutter.jpg'},
    {'title': 'Advanced Python', 'image': 'assets/images/course_python.jpg'},
    {'title': 'Machine Learning', 'image': 'assets/images/course_ml.jpg'},
    {'title': 'React Native', 'image': 'assets/images/course_react.jpg'},
    {'title': 'Blockchain Basics', 'image': 'assets/images/course_blockchain.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return Center(
        child: Text(
          'No courses recommended',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/courseDetails',
                arguments: courses[index],
              );
            },
            child: Container(
              width: 300,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(courses[index]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  courses[index]['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

