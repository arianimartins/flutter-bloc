import 'dart:convert';

import 'package:http/http.dart';
import 'package:medium_sample_bloc_one/src/models/item_model.dart';
import 'package:medium_sample_bloc_one/src/models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '813412293b21940f3d05d0b80f81546b';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    print('Entered');
    final response  = await client.get('$_baseUrl/popular?api_key=$_apiKey');
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch data');
    }
  }


  Future<TrailerModel> fetchTrailer(int movieId) async {
    print('Entered');
    final response = await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

}