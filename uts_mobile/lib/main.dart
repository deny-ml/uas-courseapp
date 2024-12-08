import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/screens/cart_page.dart';
import 'package:uts_mobile/screens/notifications_page.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/course_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 112, 50, 163),
          foregroundColor: Color.fromARGB(255, 236, 236, 236),
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
      ), // Tema gelap bawaan Flutter dengan kustomisasi
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // Atur tema berdasarkan pengaturan
      home: LoginScreen(), // Halaman awal
      routes: {
        '/home': (context) => MainPage(), // Mengarah ke MainPage setelah login
        '/notifications': (context) => NotificationsPage(),
        '/cart': (context) => CartPage(),
        '/login': (context) => LoginScreen(),
        '/profile_screen': (context) => ProfileScreen(),
        '/course_screen': (context) => CoursesScreen(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CoursesScreen(), // Halaman daftar kursus
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Halaman yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(255, 112, 50, 163), // Warna ungu saat dipilih
        unselectedItemColor: Colors.grey, // Warna abu-abu saat tidak dipilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
