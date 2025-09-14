import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'home_screen.dart';
import 'search_movie.dart';
import 'saved.dart';
import 'FAQ.dart';

class MovieTrailerPage extends StatefulWidget {
  const MovieTrailerPage({super.key, required this.dataFromIntroduction});

  final dynamic dataFromIntroduction;

  @override
  State<MovieTrailerPage> createState() => _MovieTrailerPageState();
}

class _MovieTrailerPageState extends State<MovieTrailerPage> {
  late YoutubePlayerController _controller;
  int currentPageIndex = 0; // Default to Home tab

  @override
  void initState() {
    super.initState();

    // Replace this with your YouTube video URL
    String videoUrl = "https://www.youtube.com/watch?v=nqbWWtpwtp0";

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Movie Trailer'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'X-Men: Dark Phoenix',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('4.6',
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      const SizedBox(width: 8),
                      _buildRatingStars(4.6),
                    ],
                  ),
                  const Text('(1K votes, average: 4.67 out of 5)', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 16),
                  _buildInfoRow('Duration', '113 min'),
                  _buildInfoRow('Release', '2019'),
                  const SizedBox(height: 16),
                  const Text('You may also like',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  _buildRecommendedMovies(),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,

      // Updated BottomNavigationBar
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
                  MaterialPageRoute(builder: (context) => const SearchMovies(title: '', movies: '')),
                );
                break;
              case 2: // Saved
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedPage(title: '', movies: '', dataFromIntroduction: null)),
                );
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

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildRecommendedMovies() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRecommendedMovieItem('X-Men: Apocalypse'),
          _buildRecommendedMovieItem('X-Men: Days of Future Past'),
          _buildRecommendedMovieItem('X-Men: First Class'),
        ],
      ),
    );
  }

  Widget _buildRecommendedMovieItem(String title) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
