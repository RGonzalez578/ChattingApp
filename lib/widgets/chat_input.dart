import 'package:chat_app/models/author_entity.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  final msgInputController = TextEditingController();

  void onSendMessage() {
    ChatMessageEntity newMessage = ChatMessageEntity(
        text: msgInputController.text,
        id: '',
        author: AuthorEntity(username: 'Ronald'),
        createdAt: 1697004964,
        delivered: true,
        viewed: false,
        receiver: AuthorEntity(username: 'Florencio'));

    onSubmit(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: msgInputController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white38),
                  hintText: 'Message',
                  border: InputBorder.none),
            ),
          ),
          IconButton(
            onPressed: onSendMessage,
            icon: const Icon(Icons.send),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
