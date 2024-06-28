import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/providers/user_provider.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.snap['profilePic'].toString()),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${widget.snap['name']} ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: widget.snap['text'],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                        DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // TODO: Add Like Functionality in Comments
          // Container(
          //   padding: EdgeInsets.all(8),
          //   child: const Icon(Icons.favorite, size:16),
          // )
        ],
      ),
    );
  }
}
