import 'package:demo/login_screen.dart';
import 'package:demo/Screen/search_movie.dart';
import 'package:flutter/material.dart';
import 'package:demo/Screen/FAQ.dart';
import 'package:demo/Screen/saved.dart';

import 'movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.dataFromIntroduction});
  final dynamic dataFromIntroduction;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0; // Moved to state

  // Separate widget for navigation bar
  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      backgroundColor: const Color(0xFF19171A),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home, color: Colors.white), // Unselected icon
          selectedIcon: Icon(Icons.home, color: Colors.red), // Selected icon
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_rounded, color: Colors.white),
          selectedIcon: Icon(Icons.search_rounded, color: Colors.red),
          label: 'Search',
        ),
        NavigationDestination(icon: Icon(Icons.screenshot_monitor_rounded, color: Colors.white), selectedIcon: Icon(Icons.screenshot_monitor_rounded, color: Colors.red), label: 'Save'),
        NavigationDestination(icon: Icon(Icons.add_comment_rounded, color: Colors.white), selectedIcon: Icon(Icons.add_comment_rounded, color: Colors.red), label: 'FAQ'),
      ],
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;

          // Handle navigation based on index
          switch (index) {
            case 0:
              // No navigation needed for Home (index 0)
              break;
            case 1:
              // Navigate to SearchMovies screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchMovies(
                          title: '',
                          movies: '',
                        )),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) =>  const SavedPage(title: '', movies: '', dataFromIntroduction: null,))
                );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FAQPage())

              );
              break;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19171A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19171A),
        title: const Text(
          'MOVIE APP',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800,fontSize: 30, wordSpacing: 3),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          MovieListScreen(),
          SearchMovies(
            title: '',
            movies: '',
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
