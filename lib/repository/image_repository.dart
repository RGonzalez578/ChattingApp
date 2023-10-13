import 'dart:convert';
import 'dart:io';
import '../core/constants.dart';
import '../models/apiImage_entity.dart';
import 'package:http/http.dart' as http;
import '../models/response_api_image_entity.dart';

class ImageRepository{

  Future<List<ApiImage>> getNetworkImages() async {
    // Make request to API
    final response = await http.get(Uri.parse(imagesApiUrl),
        headers: {HttpHeaders.authorizationHeader: imagesApiKey});

    // Check if something went wrong
    if (response.statusCode == HttpStatus.ok) {
      final ResponseImageApi decodedList =
      ResponseImageApi.fromJson(jsonDecode(response.body));
      final List<ApiImage> images =decodedList.photos;
      return images;
    } else {
      return throw Exception(
          'Error while retrieving api data. StatusCode: ${response.statusCode}');
    }
  }
}