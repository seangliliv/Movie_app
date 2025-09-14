import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';
import 'search_movie.dart';
import 'FAQ.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key, required this.title, required this.movies, required this.dataFromIntroduction});

  final String title;
  final String movies;
  final dynamic dataFromIntroduction;

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<dynamic> movieData = [];
  int currentPageIndex = 2; // Default to the Saved tab

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  Future<void> fetchMovieData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=e2efc5ee7faba1e5474260632b4698d9&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'));
    if (response.statusCode == 200) {
      setState(() {
        movieData = jsonDecode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load movie data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2:30', style: TextStyle(fontSize: 16)),
        actions: const [
          Icon(Icons.signal_cellular_alt),
          SizedBox(width: 8),
          Text('5G'),
          SizedBox(width: 8),
          Icon(Icons.battery_full),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('All Saved', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
              onSubmitted: (query) => searchMovies(query),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: movieData.length,
              itemBuilder: (context, index) {
                final movie = movieData[index];
                final posterPath = movie['poster_path'];
                final posterUrl = 'https://image.tmdb.org/t/p/w500$posterPath';
                return Card(
                  child: Image.network(posterUrl, fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;

            // Handle navigation
            switch (index) {
              case 0: // Home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
              case 1: // Search
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchMovies(title: '', movies: '')),
                );
                break;
              case 2: // Saved
              // Stay on the current screen
                break;
              case 3: // FAQ
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'FAQ'),
        ],
      ),
    );
  }

  Future<void> searchMovies(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=e2efc5ee7faba1e5474260632b4698d9&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'));
    if (response.statusCode == 200) {
      setState(() {
      });
    }
  }
}
