import 'dart:convert';
import 'dart:io';
import 'package:chat_app/core/constants.dart';
import 'package:chat_app/models/apiImage_entity.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/models/response_api_image_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

  Future<List<ApiImage>> _getImages() async {
    // Make request to API
    final response = await http.get(Uri.parse(imagesApiUrl),
        headers: {HttpHeaders.authorizationHeader: imagesApiKey});

    // Check if something went wrong
    if (response.statusCode == HttpStatus.ok) {
      final ResponseImageApi decodedList =
          ResponseImageApi.fromJson(jsonDecode(response.body));
      final List<ApiImage> images =decodedList.photos;
      return images;
    } else {
      return throw Exception(
          'Error while retrieving api data. StatusCode: ${response.statusCode}');
    }
  }

  void onMessageSent(ChatMessageEntity message) {
    setState(() {
      _messages.add(message);
    });
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
          FutureBuilder<List<ApiImage>>(
              future: _getImages(),
              builder: (BuildContext context, AsyncSnapshot<List<ApiImage>> snap) {
                if (snap.hasData) return Image.network(snap.data![0].sizes.small);
                return const CircularProgressIndicator();
              }),
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
          ChatInput(
            onSubmit: onMessageSent,
          )
        ],
      ),
    );
  }
}
