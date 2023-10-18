import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Telegram',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
        fontFamily: 'RedHatDisplay',
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo, foregroundColor: Colors.black38),
      ),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
