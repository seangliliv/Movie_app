import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required dataFromIntroduction});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('M', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign In', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://i.pinimg.com/736x/9b/99/1b/9b991b1e1248b1c7b22e44b857340d5e.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('X-Men: Dark Phoenix', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Trailer'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jean Grey begins to develop incredible powers that corrupt and turn her into a Dark Phoenix, causing the X-Men to have to decide if her life is worth more than all of humanity.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Director', 'Simon Kinberg'),
                  _buildInfoRow('Writer', 'Simon Kinberg'),
                  _buildInfoRow('Stars', 'James McAvoy\nMichael Fassbender\nJennifer Lawrence'),
                  _buildInfoRow('IMDBPro', 'See production info at IMDBPro'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'FAQ'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}