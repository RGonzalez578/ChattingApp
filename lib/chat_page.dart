import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'gg',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('pressed');
            },
            icon: Icon(Icons.logout),
            color: Colors.black54,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your message!',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                Image.network(
                    'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756')
              ],
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your message!',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                Image.network(
                    'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756')
              ],
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your message!',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                Image.network(
                    'https://static.wikia.nocookie.net/stardewvalley/images/8/8c/Leah-Portrait_192px.png/revision/latest/thumbnail/width/360/height/360?cb=20160306051756')
              ],
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
        ],
      ),
    );
  }
}
