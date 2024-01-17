import 'package:alarm/components/MyDrawer.dart';
import 'package:alarm/components/MyPostButton.dart';
import 'package:alarm/components/MyTextfield.dart';
import 'package:alarm/database/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/Button.dart';
import '../components/MyListTile.dart';
import 'IstanbulPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //  firestore acces
  final FireStoreDatabase database = FireStoreDatabase();

  TextEditingController newPostController = TextEditingController();

  void navigateToIstanbulPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IstanbulPage()),
    );
  }

  //  post message
  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          //  post
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Button(
              text: 'Istanbul',
              onTap: () => navigateToIstanbulPage(context),
            ),
          ),
        ],
      ),
    );
  }
}
