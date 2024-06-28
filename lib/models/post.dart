import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetmefitchallenges/models/user.dart';

class Post {
  final String description; // Post Description entered by the user
  final String uid; // UID that made the post
  final String name; // Name of the user that made the post
  final String postId; // Unique post ID
  final datePublished; // Date the post was published
<<<<<<< HEAD
  //final String timelineId; TODO: Add timeline ID
  final String postUrl; //
  final String profImage; //
  final likes;
  // TODO: Add A Challenge ID

  const Post({
    required this.description,
    required this.uid,
    required this.name,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });
=======
  final String? timelineId; //TODO: Add timeline ID
  final String postUrl; //
  final String profImage; //
  final likes;
  final String? challengeId;
  // TODO: Add A Challenge ID

  const Post(
      {required this.description,
      required this.uid,
      required this.name,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.profImage,
      required this.likes,
      this.challengeId,
      this.timelineId});
>>>>>>> origin/kundan_new

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'name': name,
        'postId': postId,
        'datePublished': datePublished,
        //List of UID's of different people that follow the user
        'postUrl': postUrl,
        //List of the challenges the user has participated in
        'profImage': profImage,
        //A List of other users' UIDs that this user follows
        'likes': likes,
<<<<<<< HEAD
=======
        'challengeId': challengeId,
        'timelineId': timelineId,
>>>>>>> origin/kundan_new
      };

  static Post fromSnap(DocumentSnapshot snap) {
    // TODO: If there is any issue with user sign up functions refer to this "User instance" in this function definition
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        uid: snapshot['uid'],
        name: snapshot['name'],
        description: snapshot['description'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['following'],
<<<<<<< HEAD
=======
        timelineId: snapshot['timelineId'],
        challengeId: snapshot['challengeId'],
>>>>>>> origin/kundan_new
        likes: snapshot['likes']);
  }
}
