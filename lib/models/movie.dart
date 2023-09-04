class Movie {
  final int id;
  final String title;
  final String summary;
  final String coverImage;
  final int year;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.summary,
    required this.coverImage,
    required this.year,
    required this.rating,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      summary: map['summary'],
      coverImage: map['large_cover_image'],
      year: map['year'],
      rating: map['rating'].toDouble(),
    );
  }
}
