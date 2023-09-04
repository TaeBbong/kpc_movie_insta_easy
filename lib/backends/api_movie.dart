import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_insta/models/movie.dart';

class MovieAPI {
  final url = 'https://yts.mx/api/v2/list_movies.json';
  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> list =
          jsonDecode(utf8.decode(response.bodyBytes))['data']['movies'];
      return list.map((e) => Movie.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
