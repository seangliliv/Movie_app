// import 'package:demo/Screen/show_movie.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../Model/model.dart';
//
//
// class SearchMovies extends StatefulWidget {
//   const SearchMovies({super.key});
//
//   @override
//   State<SearchMovies> createState() => _SearchMoviesState();
// }
//
// class _SearchMoviesState extends State<SearchMovies> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Movie> movieData = [];  // Change to List<Movie> to store Movie objects
//   bool _isLoading = false;
//   bool _hasError = false;
//   final String _apiKey = 'e2efc5ee7faba1e5474260632b4698d9';
//
//   Future<void> fetchPopularMovies() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//     });
//
//     final url =
//         'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1';
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['results'];
//         setState(() {
//           movieData = List<Movie>.from(data.map((movieMap) => Movie.fromMap(movieMap)));
//         });
//       } else {
//         setState(() {
//           _hasError = true;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _hasError = true;
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   Future<void> searchMovies(String query) async {
//     if (query.isEmpty) return;
//
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//     });
//
//     final url =
//         'https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$query&language=en-US&page=1';
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['results'];
//         setState(() {
//           movieData = List<Movie>.from(data.map((movieMap) => Movie.fromMap(movieMap)));
//         });
//       } else {
//         setState(() {
//           _hasError = true;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _hasError = true;
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPopularMovies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF19171A),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF19171A),
//         title: const Text('Search Movies'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               style: const TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                 hintText: 'Search for movies...',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 prefixIcon: const Icon(Icons.search, color: Colors.black),
//                 filled: true,
//                 fillColor: Colors.white70,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(28),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//               onSubmitted: searchMovies,
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Search Results',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ? const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.red,
//               ),
//             )
//                 : _hasError
//                 ? const Center(
//               child: Text(
//                 'Failed to load movies. Please try again.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//                 : movieData.isEmpty
//                 ? const Center(
//               child: Text(
//                 'No movies found.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//                 : GridView.builder(
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: movieData.length,
//               itemBuilder: (context, index) {
//                 final movie = movieData[index];
//                 final posterUrl = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';
//
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to MovieDetailsScreen
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieDetailsScreen(
//                           movie: movie, // Pass the movie ID
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     color: Colors.grey[900],
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Image.network(
//                             posterUrl,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                             const Icon(Icons.broken_image, color: Colors.grey),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(
//                             movie.title ?? 'Unknown Title',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(color: Colors.white, fontSize: 14),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
