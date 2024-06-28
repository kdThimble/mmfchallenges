import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:meetmefitchallenges/utils/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:meetmefitchallenges/models/user.dart' as model;
import '../providers/user_provider.dart';


  class MobileScreenLayout extends StatefulWidget {
    const MobileScreenLayout({Key? key}) : super(key: key);

    @override
    State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
  }

  class _MobileScreenLayoutState extends State<MobileScreenLayout> {

    //Page controller for tab bar pages
    late PageController pageController;

    @override
    void initState(){
      super.initState();
      pageController = PageController();
    }

    @override
    void dispose(){
      super.dispose();
      pageController.dispose();
    }

    void navigationTapped(int page){
      pageController.jumpToPage(page);
    }

    void onPageChanged(int page){
      setState((){
        _page = page;
      });
    }

    String name = "";
    int _page = 0;
    @override
    Widget build(BuildContext context) {
      //model.User? user= Provider.of<UserProvider>(context).getUser;
      return Scaffold(
          body: PageView(
          children: homeScreenItems,
            controller: pageController,
            onPageChanged: onPageChanged,
      ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _page == 0? mmfOrange : Colors.grey,),
              label: '',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _page == 1? mmfOrange : Colors.grey,),
              label: '',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: _page == 2? mmfOrange : Colors.grey,),
              label: '',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: _page == 3? mmfOrange : Colors.grey,),
              label: '',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _page == 4? mmfOrange : Colors.grey,),
              label: '',
              backgroundColor: Colors.grey,
            ),


          ],
          onTap: navigationTapped,
        ),
      );
    }
  }




// void initState(){
//   super.initState();
//   getName();
// }
//
// void getName() async{
//   DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
//   print(snap.data());
//
//   setState((){
//     name = (snap.data() as Map<String, dynamic>)['name'];
//   });
// }