import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chat_app/widgets/login_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  final emailInputController = TextEditingController();
  final passInputController = TextEditingController();

  Widget _buildForm () {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextField(
                  controller: emailInputController,
                  validator: (value) {
                    if (value == null) {
                      return "No puede estar vacío";
                    }
                  },
                  labelText: "Email"
              ),
              LoginTextField(controller: passInputController,
                  validator: (value) {
                    if (value == null) {
                      return "No puede estar vacío";
                    }
                  },
                  labelText: "Password"
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [_buildForm()],
            ),
          ),
        )
    );
  }
}
