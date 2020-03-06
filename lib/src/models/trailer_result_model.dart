class TrailerResult {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  int size;
  String type;

  TrailerResult({this.id,
        this.iso_639_1,
        this.iso_3166_1,
        this.key,
        this.name,
        this.site,
        this.size,
        this.type});

  TrailerResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iso_3166_1 = json['iso_3166_1'];
    iso_639_1 = json['iso_639_1'];
    key = json['key'];
    name = json['name'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
  }
}

/*
class Result {
  double _popularity;
  int _voteCount;
  bool _video;
  String _posterPath;
  int _id;
  bool _adult;
  String _backdropPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds;
  String _title;
  double _voteAverage;
  String _overview;
  String _releaseDate;

  Result(result){
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];

    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }

    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  double get voteAverage => _voteAverage;

  String get title => _title;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get backdropPath => _backdropPath;

  bool get adult => _adult;

  int get id => _id;

  String get posterPath => _posterPath;

  bool get video => _video;

  int get voteCount => _voteCount;

  double get popularity => _popularity;


}
*/
