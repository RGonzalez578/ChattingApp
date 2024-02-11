import 'package:chat_app/core/constants.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chat_app/widgets/login_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app/core/brand_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailInputController = TextEditingController();
  final passInputController = TextEditingController();

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign up!',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black54
          ),
        ),
        
        const Text(
            'Welcome',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black54
            )
        ),
        
        verticalSpacing(standardSpace),
        
        SvgPicture.asset(
          'assets/images/person-add.svg',
          semanticsLabel: 'add user icon',
          colorFilter:
          ColorFilter.mode(BrandColors.primaryColor, BlendMode.srcIn),
          height: 110,
        )
      ]
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextField(
                  controller: emailInputController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No puede estar vacío";
                    }
                  },
                  labelText: "Email"),
              verticalSpacing(standardSpace),
              LoginTextField(
                  controller: passInputController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No puede estar vacío";
                    }
                  },
                  labelText: "Password")
            ],
          ),
        ),

        verticalSpacing(standardSpace),

        ElevatedButton(onPressed: signUp,
            child: const Text (
              'Sign up',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                verticalSpacing(standardSpace),
                _buildForm()
              ],
            ),
          ),
        ));
  }

  signUp () {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('Invalid');
    }
  }
}
