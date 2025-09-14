import 'package:flutter/material.dart';
import 'package:demo/Screen/home_screen.dart';
import 'package:demo/Screen/search_movie.dart';
import 'package:demo/Screen/saved.dart';
import 'package:demo/Screen/FAQ.dart';


class AppRoutes {
  static const String home = '/home';
  static const String search = '/search';
  static const String save = '/save';
  static const String faq = '/faq';


  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case search:
        return MaterialPageRoute(builder: (_) => SearchMovies(movies: '', title: '',));
      case save:
        return MaterialPageRoute(builder: (_) => SavedPage(title: '', movies: '', dataFromIntroduction: null,));
      case faq:
        return MaterialPageRoute(builder: (_) => FAQPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}