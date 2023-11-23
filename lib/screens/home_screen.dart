// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  final HomeController homeController;
  const HomeScreen({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage:
                NetworkImage(widget.homeController.user.photoURL ?? ""),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.greenAccent,
          title: Text(widget.homeController.user.displayName ?? ""),
          actions: [
            IconButton(
              onPressed: () async {
                widget.homeController.logout(context);
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          color: Colors.black12,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('sendDateTime', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data!.docs[index];
                    return Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.white,
                      child:
                          Text(message['userName'] + ': ' + message['message']),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar os dados'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        persistentFooterButtons: [
          TextFormField(
            onChanged: (value) => setState(() {}),
            controller: widget.homeController.textEditingController,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed:
                    widget.homeController.textEditingController.text.trim() ==
                            ''
                        ? null
                        : () async {
                            await widget.homeController.sendMessage(context);
                          },
                icon: const Icon(Icons.send),
              ),
              fillColor: Colors.white,
              hintText: 'Digite uma mensagem',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              contentPadding: const EdgeInsets.fromLTRB(14, 8, 7, 8),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
