import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Initial state variables
  List<ChatMessageEntity> _messages = [];

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/mockup-messages.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<ChatMessageEntity> chatMessages = decodedList.map((e) {
      return ChatMessageEntity.fromJson(e);
    }).toList();

    // Saves messages loaded from JSON to a new State
    setState(() {
      _messages = chatMessages;
    });
  }

  void onMessageSent(ChatMessageEntity message) {
    if (message.text.isNotEmpty || message.imageUrl!.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
    }
  }

  @override
  void initState() {
    _loadMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
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
                    username: username,
                  );
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          )
        ],
      ),
    );
  }
}
