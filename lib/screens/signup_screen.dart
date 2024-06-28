import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetmefitchallenges/resources/auth_methods.dart';
import 'package:meetmefitchallenges/screens/login_screen.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:meetmefitchallenges/widgets/text_field_input.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/utils.dart';
import '../widgets/meetmefitChallengesLogo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fitnessGoalController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  // TODO: Add controller for adding profile image

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _fitnessGoalController.dispose();
    //TODO: Dispose Profile image controller
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await AuthMethods().signUpUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        fitnessGoal: _fitnessGoalController.text,
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if (result != "success") {
      showSnackBar(result, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )));
    }
  }

  void navigateToLogIn() {
    print("Navigate to Login.");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
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
              size: size * 0.6,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            // Circular Widget to accept and show the selected file(Profile Photo)
            Stack(children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64, backgroundImage: MemoryImage(_image!))
                  : const CircleAvatar(
                      radius: 64,
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(
                          'https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png'),
                    ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ))
            ]),
            SizedBox(
              height: size.height * 0.02,
            ),
            //Text Field Input for First Name
            TextFieldInput(
                textEditingController: _nameController,
                hintText: "Name",
                textInputType: TextInputType.text),
            SizedBox(height: (size.height * 0.02)),
            // text field input for email
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress),
            SizedBox(height: (size.height * 0.02)),
            // text field input for password
            TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                isPass: true,
                textInputType: TextInputType.text),
            SizedBox(height: (size.height * 0.02)),
            // Text Field Input for Bio
            TextFieldInput(
                textEditingController: _fitnessGoalController,
                hintText: "Fitness Goal",
                textInputType: TextInputType.text),
            // TODO: Add Input for Birth Date
            SizedBox(height: (size.height * 0.02)),
            // login button
            InkWell(
              onTap: signUpUser,
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
                          color: primaryColor,
                        ),
                      )
                    : const Text(
                        "Sign Up",
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
                  child: const Text("Already a member?"),
                ),
                GestureDetector(
                  onTap: navigateToLogIn,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      " Log in.",
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
