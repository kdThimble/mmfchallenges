import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // 'name' : name,
  // 'uid': userCredential.user!.uid,
  // 'email': email,
  // 'fitnessGoal': fitnessGoal,
  // 'followers':[], //List of UID's of different people that follow the user
  // TODO: Kundan- Add Challenges field to user model
  // 'challenges':[], //List of the challengeIds the user has participated in
  // 'following': [], //A List of other users' UIDs that this user follows
  // 'photoUrl':photoUrl,
  // TODO: Add field mailingAddress (Compulsory)
  // TODO: Add field state
  // TODO: Add Field city
  // TODO: Add Field country
  // TODO: Add Field zipCode
  final String uid;
  final String name;
  final String email;
  final String fitnessGoal;
  final String photoUrl;
  final bool isAdmin;
  final List followers;
  final List following;
  final List challenges;
  final String? address;
  final String? state;
  final String? zipCode;
  final String? city;
  final String? country;
  final String? size;

  const User({
    this.address,
    this.state,
    this.zipCode,
    this.city,
    this.country,
    this.size,
    required this.uid,
    required this.name,
    required this.email,
    required this.fitnessGoal,
    required this.photoUrl,
    required this.isAdmin,
    required this.followers,
    required this.following,
    required this.challenges,
    // TODO: Add User Address Line 1 Mandatory
    // TODO: Add User's Address line 2 Optional
    // TODO: Add user's Postal Code Mandatory
    // TOdo: Add User's State Mandatory
    // TODO: Receiver's Name Mandatory
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
        'fitnessGoal': fitnessGoal,
        'followers':
            followers, //List of UID's of different people that follow the user
        'challenges':
            challenges, //List of the challenges the user has participated in
        'following':
            following, //A List of other users' UIDs that this user follows
        'photoUrl': photoUrl,
        'isAdmin': isAdmin,
        'address': address,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'country': country,
        'size': size
      };

  static User fromSnap(DocumentSnapshot snap) {
    // TODO: If there is any issue with user sign up functions refer to this "User instance" in this function definition
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      fitnessGoal: snapshot['fitnessGoal'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      challenges: snapshot['challenges'],
      isAdmin: snapshot['isAdmin'],
      address: snapshot['address'],
      city: snapshot['city'],
      state: snapshot['state'],
      zipCode: snapshot['zipCode'],
      country: snapshot['country'],
      size: snapshot['size'],
    );
  }
}
