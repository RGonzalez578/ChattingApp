import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/repository/image_repository.dart';
import 'package:flutter/material.dart';
import '../models/apiImage_entity.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String) onImageSelected;
  final ImageRepository _imageRepository = ImageRepository();
  NetworkImagePicker({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(standardSpace),
          color: Colors.white),
      child: FutureBuilder<List<ApiImage>>(
          future: _imageRepository.getNetworkImages(),
          builder: (BuildContext context, AsyncSnapshot<List<ApiImage>> snap) {
            if (snap.hasData) {
              return Container(
                margin: const EdgeInsets.only(
                    left: 0, top: standardSpace * 2, right: 0, bottom: 0),
                child: GridView.builder(
                    itemCount: snap.data!.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.5),
                    itemBuilder: (context, i) {
                      return InkWell(
                          // Needs to be a anonymous function in order to prevent errors
                          // while performing asynchronous operations
                          onTap: () {
                            onImageSelected(snap.data![i].sizes.large);
                            Navigator.of(context).pop();
                          },
                          child: Image.network(snap.data![i].sizes.medium,
                              fit: BoxFit.cover));
                    }),
              );
            } else if (snap.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(standardSpace),
                  child: Text('${snap.error}'),
                ),
              );
            }
            return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(child: CircularProgressIndicator()));
          }),
    );
  }
}
