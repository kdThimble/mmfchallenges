// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/resources/auth_methods.dart';
import 'package:meetmefitchallenges/screens/add_post_screen.dart';
import 'package:meetmefitchallenges/screens/mailing_address_form.dart';
import 'package:meetmefitchallenges/widgets/back_icon.dart';
import 'package:uuid/uuid.dart';

import '../utils/colors.dart';

class ChallengeDetails extends StatelessWidget {
  final snap;
  final challaengeId;
  const ChallengeDetails({super.key, this.snap, required this.challaengeId});

  @override
  Widget build(BuildContext context) {
    List<String> reviewers;
    reviewers = List.from(snap['tasks']);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Challenges",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: BackIcon(),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, //New
                            blurRadius: 10.0,
                            offset: Offset(0, 7))
                      ],
                      color: secondaryColor,
                      image: DecorationImage(
                        image: NetworkImage("${snap['photoUrl']}"),
                        // image: NetworkImage(
                        //     "https://images.unsplash.com/photo-1528720208104-3d9bd03cc9d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0.0))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    // "Spartan Weight Loss Burpee Challenge",
                    " ${snap['challengeName']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${snap['challengeGoal']}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: mmfOrange,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About the Challenge",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "${snap['challengeDescription']}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Challenge Reward",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info,
                                      size: 32,
                                      color: greyColor,
                                    ))
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Getting this reward in your mail is simple ,just need to ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              width: 215,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: greyColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Complete all challenge tasks ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: mmfOrange),
                                  ),
                                  Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          border: Border.all(
                                            color: Colors.lightGreen,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Icon(
                                        Icons.done_outlined,
                                        size: 10,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 290,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(217, 217, 217, 10)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Post photos/videos of you doing the task ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: mmfOrange),
                                  ),
                                  Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          border: Border.all(
                                            color: Colors.lightGreen,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Icon(
                                        Icons.done_outlined,
                                        size: 10,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Challenge Tasks ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: reviewers.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: Text("Day ${index + 1}"),
                          horizontalTitleGap: 25,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: greyColor),
                              borderRadius: BorderRadius.circular(20)),
                          trailing: InkWell(
                            onTap: () async {
                              DocumentSnapshot snaap = await FirebaseFirestore
                                  .instance
                                  .collection('challenges')
                                  .doc('$challaengeId')
                                  .get();
                              String timelineId = snaap['timelineId'];
                              String challengeName = snaap['challengeName'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPostScreen(
                                      timelineId: timelineId,
                                      challengeId: challaengeId,
                                    ),
                                  ));
                            },
                            child: Icon(
                              Icons.add_circle,
                              size: 30,
                              color: mmfOrange,
                            ),
                          ),
                          title: Text(reviewers[index])),
                    );
                  }),
              SizedBox(
                height: 80,
              )
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(0, 6), blurRadius: 6.0)
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                mmfOrange,
                Color.fromARGB(255, 244, 74, 12),
              ],
            ),
            color: mmfOrange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 1.5, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(50),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              if (snap['timelineId'] == "") {
                String timelineId = const Uuid().v1();
                FirebaseFirestore.instance
                    .collection('challenges')
                    .doc('$challaengeId')
                    .update({'timelineId': timelineId});
              }
              DocumentSnapshot snaap = await FirebaseFirestore.instance
                  .collection('challenges')
                  .doc('$challaengeId')
                  .get();
              String timelineId = snaap['timelineId'];
              String challengeName = snaap['challengeName'];
              print(timelineId);

              String res = await AuthMethods().createTimeLine(
                  timelineId: timelineId,
                  challengeId: challaengeId,
                  challengeName: challengeName,
                  dateCreated: DateTime.now());
              print(res);
              print("timeline Created");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MailingForm(
                            ChallengeId: challaengeId,
                          )));
            },
            child: Row(children: [
              Text("Participate Now"),
              SizedBox(
                width: 15,
              ),
              Text('\$8.99',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                width: 5,
              ),
              Text("Free "),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_sharp),
            ]),
          ),
        ));
  }
}
