import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Telegram',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'RedHatDisplay',
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.indigo, foregroundColor: Colors.black38)),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
