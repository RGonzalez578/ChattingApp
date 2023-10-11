import 'package:chat_app/modals/author_entity.dart';
import 'package:chat_app/modals/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        id: '1',
        text: 'Hello!',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        delivered: true,
        viewed: false,
        author: AuthorEntity(username: 'Ronald'),
        receiver: AuthorEntity(username: 'Florencio')),
    ChatMessageEntity(
        id: '2',
        text: 'How you doing?',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        delivered: true,
        viewed: false,
        author: AuthorEntity(username: 'Florencio'),
        receiver: AuthorEntity(username: 'Ronald')),
    ChatMessageEntity(
        id: '3',
        text: 'Like this...',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        imageUrl:
            'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756',
        delivered: true,
        viewed: false,
        author: AuthorEntity(username: 'Ronald'),
        receiver: AuthorEntity(username: 'Florencio'))
  ];
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          username,
          style: const TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
            color: Colors.black54,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, i) {
                  return ChatBubble(
                    alignment: _messages[i].author.username == username
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    entity: _messages[i],
                  );
                }),
          ),
          ChatInput()
        ],
      ),
    );
  }
}
