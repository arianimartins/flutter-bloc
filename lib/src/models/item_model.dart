import 'item_result_model.dart';

class ItemModel {
  int page;
  int totalResults;
  int totalPages;
  List<Results> results;

  ItemModel({this.page, this.totalResults, this.totalPages, this.results});

  ItemModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*
class ItemModel{
  int _page;
  int _totalResults;
  int _totalPages;
  List<Result> _results;

  ItemModel.fromJson(Map<String, dynamic> json){
    print(json['results'].length);
    _page = json['page'];
    _totalResults = json['total_results'];
    _totalPages = json['total_pages'];
    List<Result> temp = [];
    for(int i=0; i<json['results'].length; i++){
      Result result = Result(json['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Result> get results => _results;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  int get page => _page;
}*/
