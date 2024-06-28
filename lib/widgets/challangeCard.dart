// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/screens/challenge_details_screen.dart';

import '../utils/colors.dart';

class ChallangeCard extends StatefulWidget {
  final snap;
  const ChallangeCard({super.key, this.snap});

  @override
  State<ChallangeCard> createState() => _ChallangeCardState();
}

class _ChallangeCardState extends State<ChallangeCard> {
  bool _isLoading = false; //could be final
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  image: DecorationImage(
                    image: NetworkImage("${widget.snap['photoUrl']}"),
                    // image: NetworkImage(
                    //     "https://images.unsplash.com/photo-1528720208104-3d9bd03cc9d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  // "Spartan Weight Loss Burpee Challenge",
                  " ${widget.snap['challengeName']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  // "Reach your Weight Loss goals with this High Intensity 30 day Burpee Challenge",
                  "${widget.snap['challengeDescription']}", //description of the challenge
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        " Duration :${widget.snap['duration']}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Fitness Goal: ${widget.snap['challengeGoal']}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            // ignore: todo
            // TODO: Add route logic for Challenges mapping
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChallengeDetails(
                        snap: widget.snap,
                        challaengeId: widget.snap['challengeId'],
                      )));
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  gradient: LinearGradient(colors: [
                    mmfOrange,
                    mmfRed,
                  ])),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: primaryColor,
                      ),
                    )
                  : const Text(
                      "Participate",
                      style: TextStyle(
                        color: whiteTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
