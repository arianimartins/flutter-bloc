import 'package:medium_sample_bloc_one/src/models/item_model.dart';
import 'package:medium_sample_bloc_one/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies {
    return _moviesFetcher.stream;
  }

  fetchAllMovies() async{
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();