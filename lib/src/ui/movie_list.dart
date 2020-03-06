import 'package:flutter/material.dart';
import 'package:medium_sample_bloc_one/src/blocs/movie_detail_bloc_provider.dart';
import 'package:medium_sample_bloc_one/src/blocs/movies_bloc.dart';
import 'package:medium_sample_bloc_one/src/models/item_model.dart';
import 'package:medium_sample_bloc_one/src/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                fit: BoxFit.cover),
            onTap: () => openDetailPage(snapshot.data, index),
          ),
        );
      },
    );
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      var item = data.results[index];
      return MovieDetailBlocProvider(
        child: MovieDetail(
          title: item.title,
          posterUrl: item.backdropPath,
          description: item.overview,
          releaseDate: item.releaseDate,
          voteAverage: item.voteAverage.toString(),
          movieId: item.id,
        ),
      );
    }));
  }
}
