import 'package:chat_app/core/brand_colors.dart';
import 'package:chat_app/core/constants.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

// Use 'stl' shortcut to create a class that extends from StateLessWidget
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  final Uri _footerUrl = Uri.parse('https://pub.dev/');

  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await context.read<AuthService>().login(userNameController.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userNameController.text);
    } else {
      print('Login failed');
    }
  }

  Future<void> _goToURL() async {
    if (!await launchUrl(_footerUrl)) {
      throw Exception('Error while launching URL');
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        verticalSpacing(standardSpace),
        SvgPicture.asset(
          'assets/images/dialog.svg',
          semanticsLabel: 'dialog icon',
          colorFilter:
              ColorFilter.mode(BrandColors.primaryColor, BlendMode.srcIn),
          height: 110,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return GestureDetector(
      onTap: _goToURL,
      child: Column(
        children: [
          const Text(
            'Find us on',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          Text(
            _footerUrl.toString(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextField(
                  labelText: 'User Name',
                  controller: userNameController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length < 5) {
                      return 'Your username has to have more than 5 characters';
                    } else if (value != null && value.isEmpty) {
                      return 'Please type a username';
                    } else {
                      return null;
                    }
                  }),
              verticalSpacing(standardSpace),
              LoginTextField(
                controller: passwordController,
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 5) {
                    return 'Your password has to have more than 5 characters';
                  } else if (value != null && value.isEmpty) {
                    return 'Please type a username';
                  } else {
                    return null;
                  }
                },
                labelText: 'Password',
                isPassword: true,
              ),
            ],
          ),
        ),
        verticalSpacing(standardSpace),
        ElevatedButton(
            onPressed: () async {
              await loginUser(context);
            },
            child: const Text('Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
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
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            if (constraints.maxWidth > 1000) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(context),
                        _buildFooter(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildForm(context),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  verticalSpacing(standardSpace),
                  _buildForm(context),
                  verticalSpacing(standardSpace),
                  _buildFooter(),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
