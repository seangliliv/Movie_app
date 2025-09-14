
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/model.dart';

//import 'package:demo/Screen/detail_movies.dart';
import 'package:demo/Screen/show_movie.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key, this.dataFromIntroduction});
  final dynamic dataFromIntroduction;

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  get movieId => null;

  //override api , navigator bar,
  @override
  void initState() {
    super.initState();
    nowShowing = fetchNowShowingMovies(); // Call the fetchMovies function
    upComing = fetchUpcomingMovies();
    popular = fetchPopular();
  }

  late Future<List<Movie>> nowShowing;

  late Future<List<Movie>> upComing;

  late Future<List<Movie>> popular;

  bool showIconButton = true;
 // Assuming you have a way to manage this state
  Future<List<Movie>> fetchNowShowingMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=e2efc5ee7faba1e5474260632b4698d9'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load data (now showing) (status code: ${response.statusCode})");
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=e2efc5ee7faba1e5474260632b4698d9'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load data (upcoming) (status code: ${response.statusCode})");
    }
  }

  Future<List<Movie>> fetchPopular() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=e2efc5ee7faba1e5474260632b4698d9'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load data (upcoming) (status code: ${response.statusCode})");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Movie>>(
                  future: nowShowing,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Handle errors
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final movies = snapshot.data!.reversed.toList(); // Reverse the list

                    if (movies.isEmpty) {
                      return const Text('No movies found');
                    }
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];

                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${movies[index].backDropPath}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              //bottom: 15,
                                left: 10,
                                right: 0,
                                child: Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Colors.white,
                                  ),
                                )
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        // Customize these options as needed
                        height: 230.0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              const Wrap(
                children: [
                  Text(
                    "UpComing Movies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 200,
                  child: FutureBuilder<List<Movie>>(
                    future: upComing,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}'); // Handle errors
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final movies = snapshot.data!; // Use the `!` operator as data is now guaranteed

                      if (movies.isEmpty) {
                        return const Text('No movies found');
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];

                          return GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: movieId, dataFromIntroduction: null,)),
                            //   );
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(movie: movie )),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 180,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${movie.backDropPath}", // Assuming backDropPath exists
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  right: 0,
                                  child: Text(
                                    movie.title, // Use null-conditional operator for title
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              const Wrap(
                children: [
                  Text(
                    "Popular Movie",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  child: FutureBuilder<List<Movie>>(
                    future: popular,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}'); // Handle errors
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final movies = snapshot.data!; // Use the `!` operator as data is now guaranteed

                      if (movies.isEmpty) {
                        return const Text('No movies found');
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];

                          return GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: movieId, dataFromIntroduction: null,)),
                            //   );
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(movie: movie )),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 180,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${movie.backDropPath}", // Assuming backDropPath exists
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  right: 0,
                                  child: Text(
                                    movie.title, // Use null-conditional operator for title
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              const Wrap(
                children: [
                  Text(
                    "Movies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 200,
                child: FutureBuilder<List<Movie>>(
                  future: popular, // Assuming `popular` is a Future that fetches movies
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Handle errors
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final movies = snapshot.data!.reversed.toList(); // Reverse the list

                    if (movies.isEmpty) {
                      return const Text('No movies found');
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return GestureDetector(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: movieId, dataFromIntroduction: null,)),
                          //   );
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(movie: movie )),
                              );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 180,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/${movie.backDropPath}", // Assuming backDropPath exists
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 10,
                                right: 0,
                                child: Text(
                                  movie.title, // Use null-conditional operator for title
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
