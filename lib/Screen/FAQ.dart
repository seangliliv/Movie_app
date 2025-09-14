import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'saved.dart';
import 'search_movie.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String selectedLanguage = 'English'; // Default language
  final List<String> languages = ['English', 'Khmer'];
  int currentPageIndex = 3; // Default to the FAQ tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language selection dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    dropdownColor: Colors.grey[900],
                    value: selectedLanguage,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    underline: Container(
                      height: 2,
                      color: Colors.red,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                    },
                    items: languages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ExpansionTile(
                title: const Text("Video error?", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.grey[900],
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "You can report video errors to the contact below.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
              // Other FAQ content
              ExpansionTile(
                title: const Text("Other error?", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.grey[900],
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Please describe the issue in detail in the feedback box below.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: const Text("Request Movie?", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.grey[900],
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Send us the name of the movie you wish to see!",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Contact Us",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "seangliiiv@gmail.com",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Feedbacks",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Write your feedback here...",
                  hintStyle: const TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {
                    // Handle send feedback action
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedPage(
                        title: '',
                        movies: '',
                        dataFromIntroduction: null,
                      )),
                );
                break;
              case 3: // FAQ
              // Stay on the current screen
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
}
