import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;
  const ChatBubble({
    super.key,
    required this.alignment,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    bool isAuthor =
        entity.author.username == context.read<AuthService>().getUsername();

    return Align(
      alignment: alignment,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.1,
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: isAuthor ? Colors.indigo : Colors.black87,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                    bottomLeft: isAuthor
                        ? const Radius.circular(15)
                        : const Radius.circular(0),
                    bottomRight: isAuthor
                        ? const Radius.circular(0)
                        : const Radius.circular(15))),
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
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              '${entity.imageUrl}',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                verticalSpacing(standardSpace),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(entity.createdAt)
                      .toIso8601String(),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
