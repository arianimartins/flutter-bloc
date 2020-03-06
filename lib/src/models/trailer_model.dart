import 'trailer_result_model.dart';

class TrailerModel{
  int id;
  List<TrailerResult> results;

  TrailerModel({this.id, this.results});

  TrailerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = new List<TrailerResult>();
      json['results'].forEach((v) {
        results.add(new TrailerResult.fromJson(v));
      });
    }
  }

}