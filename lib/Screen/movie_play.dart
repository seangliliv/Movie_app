// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:demo/Screen/search_movie.dart';
//
//
// class MoviePlayPage extends StatefulWidget {
//   const MoviePlayPage({super.key, required dataFromIntroduction});
//
//   @override
//   State<MoviePlayPage> createState() => _MoviePlayPageState();
// }
//
// class _MoviePlayPageState extends State<MoviePlayPage> {
//   late YoutubePlayerController _controller;
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
//         NavigationDestination(icon: Icon(Icons.screenshot_monitor_rounded, color: Colors.white), selectedIcon: Icon(Icons.screenshot_monitor_rounded, color: Colors.red), label: 'Save'),
//         NavigationDestination(icon: Icon(Icons.add_comment_rounded, color: Colors.white), selectedIcon: Icon(Icons.add_comment_rounded, color: Colors.red), label: 'FAQ'),
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
//               break;
//             case 1:
//             // Navigate to SearchMovies screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const SearchMovies(
//                       title: '',
//                       movies: '',
//                     )),
//               );
//               break;
//             case 2:
//             // Implement navigation for Save (index 2)
//             // ... (add your navigation logic)
//               break;
//             case 3:
//             // Implement navigation for FAQ (index 3)
//             // ... (add your navigation logic)
//               break;
//           }
//         });
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final videoID = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=1-q8C_c-nlM&t=65s");
//     _controller = YoutubePlayerController(
//       initialVideoId: videoID!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//
//         // Uncomment the actions if needed
//         // actions: const [
//         //   Icon(Icons.signal_cellular_alt),
//         //   SizedBox(width: 8),
//         //   Text('5G'),
//         //   SizedBox(width: 8),
//         //   Icon(Icons.battery_full),
//         //   SizedBox(width: 16),
//         //   TextButton(
//         //     onPressed: () {},
//         //     child: Text('Sign In', style: TextStyle(color: Colors.white)),
//         //   ),
//         // ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           YoutubePlayer(
//             controller: _controller,
//             showVideoProgressIndicator: true,
//             progressIndicatorColor: Colors.amber,
//             progressColors: const ProgressBarColors(
//               playedColor: Colors.amber,
//               handleColor: Colors.amberAccent,
//             ),
//             onReady: () {
//               print('Player is ready.');
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('X-Men: Dark Phoenix', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       color: Colors.red,
//                       child: const Text('4.6', style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     const SizedBox(width: 8),
//                     Row(
//                       children: List.generate(5, (index) =>
//                           Icon(index < 4 ? Icons.star : Icons.star_half, color: Colors.yellow, size: 20)
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text('(1K votes, average: 4.67 out of 5)', style: TextStyle(fontSize: 12, color: Colors.grey)),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text('You may also like', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Container(
//                   height: 100,
//                   color: Colors.grey[800],
//                 ),
//                 const SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text('Post'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
