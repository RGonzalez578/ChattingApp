import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final String message;
  const ChatBubble({super.key, required this.alignment, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
            Image.network(
              'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756',
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
