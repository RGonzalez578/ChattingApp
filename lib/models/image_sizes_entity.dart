import 'package:json_annotation/json_annotation.dart';

part 'image_sizes_entity.g.dart';

@JsonSerializable()
class ImageSizes {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  ImageSizes(
      {required this.original,
      required this.large2x,
      required this.large,
      required this.medium,
      required this.small,
      required this.portrait,
      required this.landscape,
      required this.tiny});

  factory ImageSizes.fromJson(Map<String, dynamic> json) =>
      _$ImageSizesFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSizesToJson(this);
}
