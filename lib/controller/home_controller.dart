// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';
import '../screens/auth_screen.dart';
import 'auth_controller.dart';

class HomeController {
  final User user;
  final textEditingController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final firebaseFirestore = FirebaseFirestore.instance;
  HomeController({
    required this.user,
  });

  Future<void> sendMessage(BuildContext context) async {
    final message = MessageModel(
      sendDateTime: DateTime.now(),
      idUser: user.uid,
      message: textEditingController.text,
      userName: user.displayName ?? "",
    );
    try {
      await firebaseFirestore
          .collection('chat')
          .add(message.toMap(FieldValue.serverTimestamp()));
      textEditingController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: const Text('Tente novamente...'),
        ),
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            AuthScreen(authController: AuthController()),
      ),
    );
  }
}
