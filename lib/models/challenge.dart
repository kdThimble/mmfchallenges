<<<<<<< HEAD

import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge{
=======
import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
>>>>>>> origin/kundan_new
  // 'name' : name,
  // 'uid': userCredential.user!.uid,
  // 'email': email,
  // 'fitnessGoal': fitnessGoal,
  // 'followers':[], //List of UID's of different people that follow the user
  // 'challenges':[], //List of the challenges the user has participated in
  // 'following': [], //A List of other users' UIDs that this user follows
  // 'photoUrl':photoUrl,
<<<<<<< HEAD
  final String participants; // List of User Ids that have participated in this challenge
=======
  final String
      participants; // List of User Ids that have participated in this challenge
>>>>>>> origin/kundan_new
  final String challengeName;
  final String challengeId;
  final String participantsCompleted;
  final String fitnessGoal;
  final String photoUrl;
<<<<<<< HEAD
  final bool isRolling; // Boolean value if 'true' there is no ending date and keeps taking in participants
=======
  final bool
      isRolling; // Boolean value if 'true' there is no ending date and keeps taking in participants
>>>>>>> origin/kundan_new
  final String description;
  final String timelineId; // Id of the timeline related to this challenge
  final List tasks; // List of Task Ids
  final String rewardName;
  final String rewardId;
  final String rewardPhotoUrl;
  final int duration; // Number of days

<<<<<<< HEAD

=======
>>>>>>> origin/kundan_new
  const Challenge({
    required this.participants,
    required this.challengeName,
    required this.challengeId,
    required this.participantsCompleted,
    required this.fitnessGoal,
    required this.photoUrl,
    required this.isRolling,
    required this.description,
    required this.timelineId,
    required this.tasks,
    required this.rewardName,
    required this.rewardId,
    required this.rewardPhotoUrl,
    required this.duration,
  });

<<<<<<< HEAD
  Map<String, dynamic> toJson() =>{
    'participants' : participants,
    'challengeName': challengeName,
    'challengeId': challengeId,
    'fitnessGoal': fitnessGoal,
    'participantsCompleted':participantsCompleted, //List of UID's of different people that follow the user
    'photoUrl':photoUrl, //List of the challenges the user has participated in
    'isRolling': isRolling, //A List of other users' UIDs that this user follows
    'description':description,
    'timelineId': timelineId,
    'tasks':tasks,
    'timelineId': timelineId,
    'rewardName':rewardName,
    'rewardId': rewardId,
    'rewardPhotoUrl': rewardPhotoUrl,
    'duration': duration,
  };

  static Challenge fromSnap(DocumentSnapshot snap){
=======
  Map<String, dynamic> toJson() => {
        'participants': participants,
        'challengeName': challengeName,
        'challengeId': challengeId,
        'fitnessGoal': fitnessGoal,
        'participantsCompleted':
            participantsCompleted, //List of UID's of different people that follow the user
        'photoUrl':
            photoUrl, //List of the challenges the user has participated in
        'isRolling':
            isRolling, //A List of other users' UIDs that this user follows
        'description': description,
        'timelineId': timelineId,
        'tasks': tasks,
        'rewardName': rewardName,
        'rewardId': rewardId,
        'rewardPhotoUrl': rewardPhotoUrl,
        'duration': duration,
      };

  static Challenge fromSnap(DocumentSnapshot snap) {
>>>>>>> origin/kundan_new
    var snapshot = snap.data() as Map<String, dynamic>;

    return Challenge(
      participants: snapshot['participants'],
      challengeName: snapshot['challengeName'],
      challengeId: snapshot['challengeId'],
      fitnessGoal: snapshot['fitnessGoal'],
      participantsCompleted: snapshot['participantsCompleted'],
      photoUrl: snapshot['photoUrl'],
      isRolling: snapshot['isRolling'],
      description: snapshot['description'],
      timelineId: snapshot['timelineId'],
      tasks: snapshot['tasks'],
      rewardName: snapshot['rewardName'],
      rewardId: snapshot['rewardId'],
      rewardPhotoUrl: snapshot['rewardPhotoUrl'],
      duration: snapshot['duration'],
    );
  }
<<<<<<< HEAD

}
=======
}
>>>>>>> origin/kundan_new
