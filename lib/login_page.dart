import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

// Use 'stl' shortcut to create a class that extends from StateLessWidget
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatPage()));
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Let\' sign you in!',
                  textAlign: TextAlign.center,
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
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return 'Your username has to have more than 5 characters';
                        } else if (value != null && value.isEmpty) {
                          return 'Please type a username';
                        } else {
                          return null;
                        }
                      },
                      controller: userNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'User name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return 'Your password has to have more than 5 characters';
                        } else if (value != null && value.isEmpty) {
                          return 'Please type a username';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: const Text('Login',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print('Tapped');
                },
                child: const Column(
                  children: [
                    Text(
                      'Find us on',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'Lorem ipsum',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
