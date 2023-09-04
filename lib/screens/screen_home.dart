import 'package:flutter/material.dart';
import 'package:movie_insta/backends/api_movie.dart';
import 'package:movie_insta/models/movie.dart';

class HomeScreen extends StatelessWidget {
  final apiMovie = MovieAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiMovie.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return MovieFeed(
                  movie: snapshot.data![index],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MovieFeed extends StatefulWidget {
  final Movie movie;
  MovieFeed({required this.movie});
  @override
  _MovieFeedState createState() => _MovieFeedState();
}

class _MovieFeedState extends State<MovieFeed> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(widget.movie.coverImage),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
            Text(widget.movie.title),
          ],
        ),
        Text(widget.movie.summary),
      ],
    );
  }
}
