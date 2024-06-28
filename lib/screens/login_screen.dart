// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetmefitchallenges/resources/auth_methods.dart';
import 'package:meetmefitchallenges/screens/signup_screen.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:meetmefitchallenges/utils/utils.dart';
import 'package:meetmefitchallenges/widgets/text_field_input.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../widgets/meetmefitChallengesLogo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (result == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )));
    } else {
      showSnackBar(result, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    print("Navigate to Sign Up.");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // Getting the screen size to fit different phone screen sizes better
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // meetMeFit SVG Image
            MeetMeFitChallengesLogo(
              size: size,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // text field input for email
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress),
            SizedBox(height: (size.height * 0.02)),
            // text field input for password
            TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your Password",
                isPass: true,
                textInputType: TextInputType.text),
            SizedBox(height: (size.height * 0.02)),
            // login button
            InkWell(
              onTap: logInUser,
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
                        "Log In",
                        style: TextStyle(
                          color: whiteTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            SizedBox(height: (size.height * 0.02)),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            //transitioning to sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: const Text("Don't have an account?"),
                ),
                GestureDetector(
                  onTap: navigateToSignUp,
                  //print("Signup tapped!");
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      " Sign up.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mmfOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
