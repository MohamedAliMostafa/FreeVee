/// adult : false
/// backdrop_path : "/h8gHn0OzBoaefsYseUByqsmEDMY.jpg"
/// genre_ids : [28,53,80]
/// id : 603692
/// original_language : "en"
/// original_title : "John Wick: Chapter 4"
/// overview : "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes."
/// popularity : 4242.15
/// poster_path : "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"
/// release_date : "2023-03-22"
/// title : "John Wick: Chapter 4"
/// video : false
/// vote_average : 7.9
/// vote_count : 2723

class Results {
  Results({
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
   //   this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = "https://image.tmdb.org/t/p/original"+ json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
   // popularity = json['popularity'];
    posterPath ="https://image.tmdb.org/t/p/original"+   json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
   voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  //double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
 dynamic? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    //map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}