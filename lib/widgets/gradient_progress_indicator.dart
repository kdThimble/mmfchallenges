import 'package:flutter/material.dart';

import '../utils/colors.dart';

class GradientProgressIndicator extends StatelessWidget {
  const GradientProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: [mmfOrange, mmfRed],
          stops: [
            0.1,
            0.5,
          ],
        ),
      ),
      child: SizedBox(
        height: 4.0,
      ),
    );
  }
}
