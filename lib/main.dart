import 'dart:ui';

import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:chat_app/services/injection_service.dart';

void main() async {
  // Initialize singleton
  setupLocator();

  // Ensures that native code from flutter can interact to our app before
  // 1 frame will be rendered
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the authentication service before 1 frame will be rendered
  await AuthService.initService();

  // Initialize firebase service
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Replace Flutter error catching for Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Caught asynchronous errors
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // To use State notifiers we have to run app with ChangeNotifierProvider
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: const ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
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
              return const ChatPage();
            } else {
              return const LoginPage();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: {'/chat': (context) => const ChatPage()},
    );
  }
}
