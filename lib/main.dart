import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensures that native code from flutter can interact to our app before
  // 1 frame will be rendered
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the authentication service before 1 frame will be rendered
  await AuthService.initService();
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
