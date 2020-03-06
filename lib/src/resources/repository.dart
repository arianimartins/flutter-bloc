import 'package:medium_sample_bloc_one/src/models/item_model.dart';
import 'package:medium_sample_bloc_one/src/models/trailer_model.dart';
import 'package:medium_sample_bloc_one/src/resources/movie_api_provider.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() {
    return moviesApiProvider.fetchMovieList();
  }

  Future<TrailerModel> fetchTrailers(int movieId){
    return moviesApiProvider.fetchTrailer(movieId);
  }
}