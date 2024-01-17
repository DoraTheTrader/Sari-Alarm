import 'package:alarm/components/MyDrawer.dart';
import 'package:alarm/components/MyListTile.dart';
import 'package:alarm/components/MyPostButton.dart';
import 'package:alarm/components/MyTextfield.dart';
import 'package:alarm/database/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IstanbulPage extends StatelessWidget {
  IstanbulPage({super.key});

  final FireStoreDatabase database = FireStoreDatabase();

  final TextEditingController newPostController = TextEditingController();

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
        title: const Text("Istanbul"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                      hintText: "Say Something",
                      obscureText: false,
                      controller: newPostController),
                ),
                Postbutton(onTap: postMessage)
              ],
            ),
          ),
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final posts = snapshot.data!.docs;

              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                      padding: EdgeInsets.all(25),
                    child: Text("No posts here"),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      // Timestamp timestamp = post['TimeStamp'];

                      return MyListTile(subTitle: message, title: userEmail);
                    }
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
