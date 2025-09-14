// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MovieDetailsScreen extends StatefulWidget {
//   const MovieDetailsScreen({
//     super.key,
//     required int movieId,
//     required dataFromIntroduction,
//   });
//
//   @override
//   State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
// }
//
// class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
//   int? get movieId => null;
//
//   // Fetch data
//   Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
//     final response = await http.get(Uri.parse(
//         'https://api.themoviedb.org/3/movie/now_playing?api_key=e2efc5ee7faba1e5474260632b4698d9/$movieId'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body) as Map<String, dynamic>;
//       return data;
//     } else {
//       throw Exception('Failed to load movie details');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set background color to black
//       body: SingleChildScrollView(
//         child: FutureBuilder<Map<String, dynamic>>(
//           future: fetchMovieDetails(movieId!), // Fetch movie details
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final movie = snapshot.data!;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: 16 / 9,
//                     child: Image.network(
//                       buildImageUrl(movie['poster_path']),
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) =>
//                       const Center(child: Icon(Icons.error)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           movie['title'] ?? 'No Title Available',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white, // Set text color to white
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           movie['overview'] ?? 'No overview available.',
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.white, // Set text color to white
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         _buildInfoRow('Director', movie['director'] ?? 'N/A'),
//                         _buildInfoRow('Writer', movie['writer'] ?? 'N/A'),
//                         _buildInfoRow(
//                             'Stars', movie['cast']?.join('\n') ?? 'N/A'),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   'Error: ${snapshot.error}',
//                   style: const TextStyle(color: Colors.white), // White text
//                 ),
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(color: Colors.white), // White loader
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   String buildImageUrl(String imagePath) {
//     const baseUrl = 'https://image.tmdb.org/t/p/original';
//     return '$baseUrl/$imagePath';
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 80,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white, // White text
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.white), // White text
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
