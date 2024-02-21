import 'package:chat_app/utils/spaces.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.red, width: 1, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              /*mainAxisAlignment: MainAxisAlignment.spaceBetween,*/
              children: [
                const Icon(Icons.info_outline, color: Colors.red),
                horizontalSpacing(10),
                Expanded(
                    child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  overflow: TextOverflow.clip,
                ))
              ],
            )));
  }
}
