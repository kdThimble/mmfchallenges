import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/providers/user_provider.dart';
import 'package:meetmefitchallenges/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState(){
    super.initState();
    addData();
  }

  // Storing values in the user_provider.dart file or the UserProvider class
  addData() async{
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      // Constraints gives various methods to ge tthe screen size and width to set the app constraints with respect to size
        builder: (context,constraints){
          if(constraints.maxWidth > webScreenSize){
            // web screen
            return widget.webScreenLayout;
          }
          // Else Mobile Screen Layout
          return widget.mobileScreenLayout;

        });
  }
}
