import 'dart:convert';

import 'package:demo/Model/model.dart';
import 'package:http/http.dart' as http;

const apiKey = "e2efc5ee7faba1e5474260632b4698d9";

class APIServices {
  final nowShowApi = "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final upComing = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popular = "https://api.themoviedb.org/3/movie/popular?api_key=''$apiKey";


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
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?$apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception("Failed to load data (upcoming) (status code: ${response.statusCode})");
    }
  }


  Future<List<Movie>> fetchMoviesFromApi() async {

    final url = Uri.parse('https://api.themoviedb.org/3/movie/upcoming?$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      final List<Movie> movies = results.map((item) => Movie.fromMap(item)).toList();
      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
