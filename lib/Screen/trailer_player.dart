import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatelessWidget {
  final String videoId;

  const YoutubePlayerScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        liveUIColor: Colors.amber,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('YouTube Player'),
          ),
          body: player,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Ensures the background color is applied
            backgroundColor: Colors.black, // Set background color to black
            selectedItemColor: Colors.white, // Set selected icon and text color to white
            unselectedItemColor: Colors.white70, // Set unselected icon and text color to dim white
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'FAQ'),
            ],
          ),
        );
      },
    );
  }
}