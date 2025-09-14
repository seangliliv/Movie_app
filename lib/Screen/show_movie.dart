import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Model/model.dart';
import 'trailer.dart';
import 'home_screen.dart';
import 'search_movie.dart';
import 'saved.dart';
import 'FAQ.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie? movie;

  const MovieDetailsScreen({super.key, this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int currentPageIndex = 0; // Default to Home tab

  @override
  Widget build(BuildContext context) {
    if (widget.movie == null) {
      return const Center(child: Text('Error: Movie details not found'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie!.title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie poster
              Image.network(
                "https://image.tmdb.org/t/p/w300/${widget.movie!.posterPath}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
              ),
              const SizedBox(height: 16),

              // Movie title
              Text(
                widget.movie!.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),

              // Release date
              Text(
                "Release Date: ${widget.movie!.releaseDate}",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Overview
              const Text(
                "Overview:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                widget.movie!.overview,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Rating and votes
              Row(
                children: [
                  const Text(
                    "Vote Average:",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  RatingBarIndicator(
                    rating: widget.movie!.voteAverage / 2,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "(${widget.movie!.voteCount} votes)",
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Watch trailer button
              _buildTrailerButton(context, widget.movie!.id),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;

            switch (index) {
              case 0: // Home
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                break;
              case 1: // Search
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchMovies(title: '', movies: ''),
                  ),
                );
                break;
              case 2: // Saved
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedPage(title: '', movies: '', dataFromIntroduction: null),
                  ),
                );
                break;
              case 3: // FAQ
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAQPage(),
                  ),
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

  Widget _buildTrailerButton(BuildContext context, int movieId) {
    String youtubeVideoId = 'o7DMHJKhpws'; // Replace with actual trailer ID

    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieTrailerPage(dataFromIntroduction: null),
          ),
        );
      },
      child: const Text('Watch Trailer'),
    );
  }
}
