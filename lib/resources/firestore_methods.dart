import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meetmefitchallenges/models/post.dart';
import 'package:meetmefitchallenges/models/user.dart';
import 'package:meetmefitchallenges/resources/storage_methods.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/user_provider.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadAddress(
    String address,
    String state,
    String city,
    String zipCode,
    String country,
    String size,
    BuildContext context,
  ) async {
    String res = "Some Error Occoured";
<<<<<<< HEAD
    print("reached here");
=======

>>>>>>> origin/kundan_new
    final User user = Provider.of<UserProvider>(context, listen: false).getUser;
    try {
      User data = User(
          uid: user.uid,
          name: user.name,
          email: user.email,
          fitnessGoal: user.fitnessGoal,
          photoUrl: user.photoUrl,
          isAdmin: user.isAdmin,
          followers: user.followers,
          following: user.following,
          challenges: user.challenges,
          address: address,
          city: city,
          size: size,
          state: state,
          country: country,
          zipCode: zipCode);
      _firestore.collection("users").doc(user.uid).update(data.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String name,
    String profImage,
  ) async {
    String res = "Some Error Occoured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          name: name,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []
          // TODO: Add "challenge_id" and "timeline_id")
          );
      _firestore.collection("posts").doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        // user has already liked the post
        // This block accesses the "posts" collection on firebase and the document with the current postId
        // Then it updates the 'likes[]' list to remove the given uid from the 'likes' array of that document
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

<<<<<<< HEAD
=======
  Future<String> uploadTimelinePost(
    String description,
    Uint8List file,
    String uid,
    String name,
    String profImage,
    String challengeId,
    String timelineId,
  ) async {
    String res = "Some Error Occoured";
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('timelinePosts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          name: name,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: [],
          timelineId: timelineId,
          challengeId: challengeId
          // TODO: Add "challenge_id" and "timeline_id")
          );
      _firestore
          .collection("timelinesTest")
          .doc(timelineId)
          .collection("posts")
          .doc(postId)
          .set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

>>>>>>> origin/kundan_new
  Future<void> postComment(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'datePublished': DateTime.now(),
        });
      } else {
        print("Comment is empty.");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
