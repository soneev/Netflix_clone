import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/colors/constants.dart';

part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'results')
  List<SearchResultData>? result;

  SearchResp({
    this.result = const [],
  });

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }
  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResultData {
  // @JsonKey(name: 'id')
  // int? id;
  @JsonKey(name: 'original_title')
  String? original_title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$ImageAppendUrl$posterPath';

  SearchResultData({this.original_title, this.posterPath});

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }
  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
