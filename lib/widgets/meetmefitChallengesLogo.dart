import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class MeetMeFitChallengesLogo extends StatelessWidget {
  final Size size;
  const MeetMeFitChallengesLogo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/mmf_grey_logo.svg',
            height:size.height * 0.2,
          ),
          SizedBox(height:(size.height*0.02)),
          Text("C H A L L E N G E S",
            style: TextStyle(
              color: mmfRed,
            ),),
        ],
      ),
    );
  }
}
