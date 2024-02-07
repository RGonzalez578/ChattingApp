import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Ensures that native code from flutter can interact to our app before
  // 1 frame will be rendered
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the authentication service before 1 frame will be rendered
  await AuthService.initService();

  // Initialize firebase service
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // To use State notifiers we have to run app with ChangeNotifierProvider
  runApp(ChangeNotifierProvider(
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
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData && snap.data!) {
              return ChatPage();
            } else {
              return LoginPage();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
