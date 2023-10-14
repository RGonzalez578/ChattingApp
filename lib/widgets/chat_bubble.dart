import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;
  const ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.1,
            maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (entity.text.isNotEmpty)
              Text(entity.text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            if (entity.imageUrl != null && entity.imageUrl!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('${entity.imageUrl}',
                      width: MediaQuery.of(context).size.width * 0.3),
                ],
              )
          ],
        ),
      ),
    );
  }
}
