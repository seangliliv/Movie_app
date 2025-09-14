// import 'package:demo/Screen/home_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../Screen/FAQ.dart';
// import '../Screen/saved.dart';
// import '../Screen/search_movie.dart';
//
// Future<void> BottomNavigationBar() async {
//   int currentPageIndex = 0; // Moved to state
//
//   // Separate widget for navigation bar
//   Widget _buildBottomNavigationBar() {
//     return NavigationBar(
//       backgroundColor: const Color(0xFF19171A),
//       destinations: const [
//         NavigationDestination(
//           icon: Icon(Icons.home, color: Colors.white), // Unselected icon
//           selectedIcon: Icon(Icons.home, color: Colors.red), // Selected icon
//           label: 'Home',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.search_rounded, color: Colors.white),
//           selectedIcon: Icon(Icons.search_rounded, color: Colors.red),
//           label: 'Search',
//         ),
//         NavigationDestination(
//             icon: Icon(Icons.screenshot_monitor_rounded, color: Colors.white),
//             selectedIcon: Icon(
//                 Icons.screenshot_monitor_rounded, color: Colors.red),
//             label: 'Save'),
//         NavigationDestination(
//             icon: Icon(Icons.add_comment_rounded, color: Colors.white),
//             selectedIcon: Icon(Icons.add_comment_rounded, color: Colors.red),
//             label: 'FAQ'),
//       ],
//       selectedIndex: currentPageIndex,
//       onDestinationSelected: (int index) {
//         setState(() {
//           currentPageIndex = index;
//
//           // Handle navigation based on index
//           switch (index) {
//             case 0:
//             // No navigation needed for Home (index 0)
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const HomeScreen())
//               );
//               break;
//             case 1:
//             // Navigate to SearchMovies screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                     const SearchMovies(
//                       title: '',
//                       movies: '',
//                     )),
//               );
//               break;
//             case 2:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                       const SavedPage(
//                         title: '', movies: '', dataFromIntroduction: null,))
//               );
//               break;
//             case 3:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => FAQPage())
//
//               );
//               break;
//           }
//         });
//       },
//     );
//   }
//
// void setState(Null Function() param0) {
// }
// }