import 'package:chat_app/models/author_entity.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/network_img_picker.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _imageUrl = '';

  final msgInputController = TextEditingController();

  void onSendMessage() {
    ChatMessageEntity newMessage = ChatMessageEntity(
        text: msgInputController.text,
        id: '',
        author: AuthorEntity(username: 'Ronald'),
        createdAt: 1697004964,
        delivered: true,
        viewed: false,
        receiver: AuthorEntity(username: 'Florencio'),
        imageUrl: _imageUrl);

    widget.onSubmit(newMessage);
    msgInputController.clear();
    _imageUrl = '';
  }

  void onImageSelected(String img) {
    setState(() {
      _imageUrl = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePicker(
                      onImageSelected: onImageSelected,
                    );
                  });
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_imageUrl.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(_imageUrl),
                  ),
                TextField(
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
              ],
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
