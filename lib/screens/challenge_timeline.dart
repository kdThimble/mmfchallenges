import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:meetmefitchallenges/widgets/back_icon.dart';
import 'package:meetmefitchallenges/widgets/post_card.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Text(
            "MeetMeFit ",
            style: TextStyle(
              fontFamily: 'Amiko',
              fontWeight: FontWeight.bold,
              color: mmfOrange,
            ),
          ),
          Text(
            "Challenge Feed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ]),
        backgroundColor: primaryColor,
        leading: BackIcon(),
        actions: [
          IconButton(
              onPressed: () {
                _signOut();
              },
              icon: Icon(
                Icons.messenger_outline,
                color: Colors.black,
              )),
        ],
      ),

      // TODO: Do This for Challenges as well
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs
                  .length, // Returns the number of documents in the 'posts' collection on Firestore
              itemBuilder: (context, index) => PostCard(
                  snap: snapshot.data!.docs[index]
                      .data() // Getting the Post Data from Firebase and Passing it to the "PostCard Widget"
                  ));
        },
      ),
    );
  }
}
