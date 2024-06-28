import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/providers/user_provider.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';

class ChallengeListItem extends StatefulWidget {
  //final snap;
  const ChallengeListItem({Key? key}) : super(key: key);

  @override
  State<ChallengeListItem> createState() => _ChallengeListItemState();
}

class _ChallengeListItemState extends State<ChallengeListItem> {
  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
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
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1528720208104-3d9bd03cc9d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
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
                  "Spartan Weight Loss Burpee Challenge",
                  // ${widget.snap['name']}
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
                  "Reach your Weight Loss goals with this High Intensity 30 day Burpee Challenge",
                  // ${widget.snap['name']}
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //TODO: border
                      child: Text("Challenge Duration")),
                  Container(
                    //TODO: Border
                      child: Text("Fitness Goal")),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            // TODO: Add route logic for Challenges mapping
            onTap: (){},
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
