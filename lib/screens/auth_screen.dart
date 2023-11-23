// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_ifba/screens/social_login_button.dart';

import '../controller/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  final AuthController authController;
  const AuthScreen({
    Key? key,
    required this.authController,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    // widget.authController.isLoggedIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chat IFBA',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Icon(
              Icons.forum,
              color: Colors.greenAccent,
              size: 100,
            ),
            const SizedBox(
              height: 24,
            ),
            SocialLoginButton(
              onTap: () async {
                widget.authController.loginWichGoogle(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
