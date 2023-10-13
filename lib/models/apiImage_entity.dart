import 'package:json_annotation/json_annotation.dart';
import 'image_sizes_entity.dart';

part 'apiImage_entity.g.dart';

@JsonSerializable()
class ApiImage {
  int id;
  int width;
  int height;
  String url;
  String photographer;

  @JsonKey(name: 'photographer_url')
  String photographerUrl;

  @JsonKey(name: 'photographer_id')
  int photographerId;

  @JsonKey(name: 'avg_color')
  String avgColor;

  @JsonKey(name: 'src')
  ImageSizes sizes;

  bool liked;

  @JsonKey(name: 'alt')
  String altText;

  ApiImage(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.sizes,
      required this.liked,
      required this.altText});

  // The following code will be generated from a CLI command: dart run
  factory ApiImage.fromJson(Map<String, dynamic> json) =>
      _$ApiImageFromJson(json);
  Map<String, dynamic> toJson() => _$ApiImageToJson(this);
}
