import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetmefitchallenges/models/user.dart';

class Timeline {
<<<<<<< HEAD

  final String participants; // UID list of the users that can access this timeline
  final String challengeName; // Name of the challenge that this timeline belongs to
  final String posts; // List of postIds posted on this timeline
=======
  final List
      participants; // UID list of the users that can access this timeline
  final String
      challengeName; // Name of the challenge that this timeline belongs to
  final List posts; // List of postIds posted on this timeline
>>>>>>> origin/kundan_new
  final dateCreated; // Date the post was published
  final String timelineId;
  final String challengeId;

  const Timeline({
    required this.participants,
    required this.challengeName,
    required this.posts,
    required this.dateCreated,
    required this.timelineId,
    required this.challengeId,
  });

  Map<String, dynamic> toJson() => {
<<<<<<< HEAD
    'participants': participants,
    'challengeName': challengeName,
    'posts': posts,
    'dateCreated': dateCreated,
    'timelineId': timelineId,
    'challengeId': challengeId,
  };
=======
        'participants': participants,
        'challengeName': challengeName,
        'posts': posts,
        'dateCreated': dateCreated,
        'timelineId': timelineId,
        'challengeId': challengeId,
      };
>>>>>>> origin/kundan_new

  static Timeline fromSnap(DocumentSnapshot snap) {
    // TODO: If there is any issue with user sign up functions refer to this "User instance" in this function definition
    var snapshot = snap.data() as Map<String, dynamic>;

    return Timeline(
<<<<<<< HEAD
        participants: snapshot['participants'],
        challengeName: snapshot['challengeName'],
        posts: snapshot['posts'],
        dateCreated: snapshot['dateCreated'],
        timelineId: snapshot['timelineId'],
        challengeId: snapshot['challengeId'],
=======
      participants: snapshot['participants'],
      challengeName: snapshot['challengeName'],
      posts: snapshot['posts'],
      dateCreated: snapshot['dateCreated'],
      timelineId: snapshot['timelineId'],
      challengeId: snapshot['challengeId'],
>>>>>>> origin/kundan_new
    );
  }
}
