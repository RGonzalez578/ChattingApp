import 'package:flutter/material.dart';

// Use 'stl' shortcut to create a class that extends from StateLessWidget
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Telegram'),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button pressed');
        },
      ),
      body: Column(
        children: [
          const Text('Let\' sign you in!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5)),
          const Text(
            'Welcome back \n You\'ve been missed',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black54),
          ),
          Image.network(
            'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756',
            height: 150,
          ),
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756')),
                borderRadius: BorderRadius.circular(24),
                color: Colors.blue),
          )
        ],
      ),
    );
  }
}
