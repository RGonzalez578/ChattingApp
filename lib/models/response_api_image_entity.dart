import 'package:json_annotation/json_annotation.dart';
import 'apiImage_entity.dart';

part 'response_api_image_entity.g.dart';

@JsonSerializable()
class ResponseImageApi {
  int? page;

  @JsonKey(name: 'per_page')
  int? photosPerPage;

  List<ApiImage> photos;

  ResponseImageApi({this.page, this.photosPerPage, required this.photos});

  factory ResponseImageApi.fromJson(Map<String, dynamic> json) =>
      _$ResponseImageApiFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseImageApiToJson(this);
}
