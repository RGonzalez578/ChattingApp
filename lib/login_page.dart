import 'package:flutter/material.dart';

// Use 'stl' shortcut to create a class that extends from StateLessWidget
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Let\' sign you in!',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5)),
            const Text(
              'Welcome back \n You\'ve been missed',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
            Image.network(
              'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756',
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
