import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:meetmefitchallenges/widgets/challangeCard.dart';

import '../widgets/post_card.dart';

class ChallengesListScreen extends StatefulWidget {
  const ChallengesListScreen({Key? key}) : super(key: key);

  @override
  State<ChallengesListScreen> createState() => _ChallengesListScreenState();
}

class _ChallengesListScreenState extends State<ChallengesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Challenges",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('challenges').snapshots(),
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
                  itemBuilder: (context, index) => ChallangeCard(
                      snap: snapshot.data!.docs[index]
                          .data() // Getting the Post Data from Firebase and Passing it to the "PostCard Widget"
                      ));
            }));
  }
}
