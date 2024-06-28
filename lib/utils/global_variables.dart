import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/screens/challenges_list_screen.dart';
import 'package:meetmefitchallenges/screens/comments_screen.dart';
import 'package:meetmefitchallenges/widgets/challenge_list_item.dart';

import '../screens/add_post_screen.dart';
import '../screens/challenge_timeline.dart';

const webScreenSize = 600;

var homeScreenItems = [
  Timeline(),
  ChallengesListScreen(),
  AddPostScreen(
    challengeId: "",
    timelineId: "",
  ),
  ChallengeListItem(),
  Text("profile"),
];
