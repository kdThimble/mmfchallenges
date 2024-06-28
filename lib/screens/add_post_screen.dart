import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetmefitchallenges/resources/firestore_methods.dart';
import 'package:meetmefitchallenges/utils/utils.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../utils/colors.dart';
import '../widgets/back_icon.dart';
import '../widgets/gradient_progress_indicator.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key, required this.challengeId, required this.timelineId})
      : super(key: key);

  String challengeId;
  String timelineId;

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;

  /* Creating a function that returns a simple Dialog Box that allows the user to
  choose from options for selecting photos before uploading the photo */

  _selectImage(BuildContext context) async {
    Size size = MediaQuery.of(context).size;

    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create a post"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Take a photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState() {
                    _file = file;
                  }
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Choose from photos"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // Setting the properties of the image before posting
  void postImage(
    String uid,
    String name,
    String profImage,
    // TODO: Add a "challenge_id" here that would link this image to the challenge
    // TODO: Add a "challenge_name" here that would link this image to the challenge(from the challenge list view on this screen)
    // TODO: Add a "timeline_id" here that would link this image to a timeline
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
          _descriptionController.text, _file!, uid, name, profImage);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar('Posted Successfully', context);
        clearImage();
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(err.toString(), context);
    }
  }

  void timelinePostImage(
    String uid,
    String name,
    String profImage,
    String challengeId,
    String timelineId,
    // String challengeName,
    // TODO: Add a "challenge_id" here that would link this image to the challenge
    // TODO: Add a "challenge_name" here that would link this image to the challenge(from the challenge list view on this screen)
    // TODO: Add a "timeline_id" here that would link this image to a timeline
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadTimelinePost(
          _descriptionController.text,
          _file!,
          uid,
          name,
          profImage,
          challengeId,
          timelineId);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar('Posted Successfully', context);
        clearImage();
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(err.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List images = ["upload1.svg", "upload2.svg", "upload3.svg"];
    int randomNumber = Random().nextInt(3);

    final User user = Provider.of<UserProvider>(context).getUser;
    Size size = MediaQuery.of(context).size;

    return _file == null
        ? Scaffold(
            appBar: AppBar(
              title: const Text(
                "Make a post",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: primaryColor,
            ),
            body: Column(
              children: [
                SvgPicture.asset(
                  'assets/${images[randomNumber]}',
                  height: size.height * 0.5,
                ),
                SizedBox(height: (size.height * 0.04)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    "Upload a picture related to your challenge or task for the day",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: (size.height * 0.02)),
                InkWell(
                  onTap: () => _selectImage(context),
                  child: Container(
                    width: size.width * 0.9,
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
                    child: const Text(
                      "Upload Image",
                      style: TextStyle(
                        color: whiteTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () => clearImage(),
              ),
              title: const Text(
                "Post to Challenge",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () {
                    timelinePostImage(user.uid, user.name, user.photoUrl,
                        widget.challengeId, widget.timelineId);
                  },
                  child: const Text(
                    "Post",
                    style: TextStyle(
                      color: mmfRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                isLoading
                    ? GradientProgressIndicator()
                    : const Padding(
                        padding: EdgeInsets.only(
                        top: 0,
                      )),
                const Divider(),
                Image(
                  image: MemoryImage(_file!),
                  width: double.infinity,
                  height: size.height * 0.4,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                      backgroundColor: Colors.white70,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: "Write a caption...",
                          border: InputBorder.none,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
                // TODO: Add Challenge List to tag the post with a challenge
              ],
            ),
          );
  }
}
