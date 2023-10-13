import 'package:chat_app/repository/image_repository.dart';
import 'package:flutter/material.dart';
import '../models/apiImage_entity.dart';

class NetworkImagePicker extends StatelessWidget {
  final ImageRepository _imageRepository = ImageRepository();
  NetworkImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApiImage>>(
        future: _imageRepository.getNetworkImages(),
        builder: (BuildContext context, AsyncSnapshot<List<ApiImage>> snap) {
          if (snap.hasData) {
            return GridView.builder(
                itemCount: snap.data!.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.5),
                itemBuilder: (context, i) {
                  return Image.network(snap.data![i].sizes.small);
                });
          }
          return const Padding(
              padding: EdgeInsets.all(8),
              child: Center(child: CircularProgressIndicator()));
        });
  }
}
