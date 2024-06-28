import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/models/timeline.dart';
import 'package:meetmefitchallenges/models/user.dart' as model;
import 'package:meetmefitchallenges/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentuser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentuser.uid).get();

    return model.User.fromSnap(snap);
  }

  // Sign Up user
  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
    required String fitnessGoal,
    required Uint8List file, // For the Profile Photo
  }) async {
    String result = "Some Error Occoured";
    try {
      if (name.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          fitnessGoal.isNotEmpty) {
        // register user
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);
        //The userCredential object will give us user data like uid, email, etc.

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user to our database

        model.User user = model.User(
          uid: userCredential.user!.uid,
          name: name,
          email: email,
          fitnessGoal: fitnessGoal,
          photoUrl: photoUrl,
          followers: [],
          following: [],
          challenges: [],
          isAdmin: false,
        );

        /*
            What this means is that we are communicating with firestore and requesting
            it to create the collection 'users' if it does not already exist, followed by
            creating a document named after the user's uid.
          */
        await _firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJson(),
            );

        result = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        result = "You have entered an invalid email.";
      } else if (e.code == "email-already-in-use") {
        result = "This email is already in use by another account.";
      } else if (e.code == "operation-not-allowed") {
        result =
            "Your account has been suspended. Kindly contact support for more information";
      } else if (e.code == "weak-password") {
        result = "Your password should be at least 6 characters long.";
      } else {
        result = "Aw Snap! An unknown error occurred.";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

//creating a timeline
  Future<String> createTimeLine({
    required String timelineId,
    required String challengeId,
    required String challengeName,
    required dateCreated,
  }) async {
    String result = "Some Error Occoured";
    try {
      if (timelineId.isNotEmpty || challengeId.isNotEmpty) {
        Timeline timeline = Timeline(
            participants: [],
            challengeName: challengeName,
            posts: [],
            dateCreated: dateCreated,
            timelineId: timelineId,
            challengeId: challengeId);
        await _firestore.collection('timelinesTest').doc(timelineId).set(
              timeline.toJson(),
            );

        result = "success";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

// logging in User

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = "Some error occoured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //log in the user
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } else {
        result = "Please fill up all fields.";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email" || e.code == "wrong-password") {
        result = "You have entered an invalid email/password";
      } else if (e.code == "user-disabled") {
        result =
            "This account has been disabled. Kindly contact support for more information.";
      } else if (e.code == "user-not-found") {
        result =
            "This user does not exist. Kindly Sign Up to create an account.";
      } else {
        result = "Aw Snap! An unknown error occurred.";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
