import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/display_error_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chat_app/widgets/login_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app/core/constants/brand_colors.dart';
import 'package:chat_app/services/auth_service.dart';

import 'services/injection_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailInputController = TextEditingController();
  final passInputController = TextEditingController();
  final displayNameInputController = TextEditingController();
  final _navigationService = getIt<NavigationService>();

  String? errorMessage;

  Widget _buildHeader() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        'Sign up!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      const Text('Welcome',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black54)),
      verticalSpacing(standardSpace),
      SvgPicture.asset(
        'assets/images/person-add.svg',
        semanticsLabel: 'add user icon',
        colorFilter:
            ColorFilter.mode(BrandColors.primaryColor, BlendMode.srcIn),
        height: 110,
      )
    ]);
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
                controller: displayNameInputController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No puede estar vacío';
                  }
                },
                labelText: 'Display name',
                isPassword: false,
              ),
              verticalSpacing(standardSpace),
              LoginTextField(
                controller: emailInputController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No puede estar vacío';
                  }
                },
                labelText: 'Email',
              ),
              verticalSpacing(standardSpace),
              LoginTextField(
                controller: passInputController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No puede estar vacío';
                  }
                },
                labelText: 'Password',
                isPassword: true,
              )
            ],
          ),
        ),
        verticalSpacing(standardSpace),
        if (errorMessage != null) _buildErrorMessage(),
        ElevatedButton(
          onPressed: () async {
            await signUp(context);
          },
          child: const Text(
            'Sign up',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  Widget _buildErrorMessage() {
    return Column(
      children: [
        ErrorMessage(message: errorMessage!),
        verticalSpacing(standardSpace)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
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

  Future<void> signUp(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final resultSignUp = await AuthService().signUpEmailPass(
          emailInputController.text,
          passInputController.text,
          displayNameInputController.text);
      if (resultSignUp == null) {
        setState(() {
          errorMessage = null;
        });
        _navigationService.pushReplacementNamed('/chat');
      } else {
        setState(() {
          errorMessage = AuthService().validateErrors(resultSignUp);
        });
      }
    } else {
      print('Invalid');
    }
  }
}
