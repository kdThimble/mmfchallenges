// ignore_for_file: unused_field, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/resources/firestore_methods.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

class MailingForm extends StatefulWidget {
  final ChallengeId;
  const MailingForm({super.key, this.ChallengeId});

  @override
  State<MailingForm> createState() => _MailingFormState();
}

class _MailingFormState extends State<MailingForm> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final addressEditingController = TextEditingController();
  final stateEditingController = TextEditingController();
  final zipCodeEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  String countryvalue = 'India';
  String sizevalue = 'S';
  bool _isLoading = false;
  var sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  var country = [
    'India',
    'USA',
  ];
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context, listen: false).getUser;
    print(user.uid);
    final addressField = TextFormField(
        autofocus: false,
        controller: addressEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Address cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid address");
          }
          return null;
        },
        onSaved: (value) {
          addressEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
            hintText: "e.g. 1 Milton avenue,Jersey City,NJ",
            border: InputBorder.none));
    final cityField = TextFormField(
        autofocus: false,
        controller: cityEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("City cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          cityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
            hintText: "e.g. Jersey City",
            border: InputBorder.none));
    final stateFeild = TextFormField(
        autofocus: false,
        controller: stateEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("State cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          stateEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "e.g. New Jersey/NJ",
          border: InputBorder.none,
        ));
    final zipCodeField = TextFormField(
        autofocus: false,
        controller: zipCodeEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Zipcode cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          zipCodeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
            hintText: "e.g. 07307",
            border: InputBorder.none));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Challenges",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              fontFamily: "Amiko"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Kindly enter your mailing address so we could send your Challenge Rewards to your doorstep",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: addressField),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "State",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: stateFeild),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Zip Code",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: zipCodeField),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "City",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: cityField),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Country",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greyColor.withOpacity(0.4), //<-- SEE HERE
                      ),
                      child: DropdownButton(
                        value: countryvalue,
                        isExpanded: true,

                        borderRadius: BorderRadius.circular(12),

                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: country.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            countryvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Size",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greyColor.withOpacity(0.4), //<-- SEE HERE
                      ),
                      child: DropdownButton(
                        value: sizevalue,
                        isExpanded: true,

                        borderRadius: BorderRadius.circular(12),

                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: sizes.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            sizevalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                String res = await FirestoreMethods().uploadAddress(
                    addressEditingController.text,
                    stateEditingController.text,
                    cityEditingController.text,
                    zipCodeEditingController.text,
                    countryvalue,
                    sizevalue,
                    context);
                print("updateiing address");
                print(widget.ChallengeId);
                if (res == "success") {
                  try {
                    await _firestore.collection("users").doc(user.uid).update(
                      {
                        "challenges":
                            FieldValue.arrayUnion([widget.ChallengeId])
                      },
                    );
                  } catch (e) {
                    print("here is the error in 1");
                  }
                  try {
                    String cid = widget.ChallengeId;
                    await _firestore
                        .collection("challenges")
                        .doc(cid)
                        .get()
                        .then(
                      (value) {
                        print(value.exists);
                      },
                    );

                    await _firestore.collection("challenges").doc(cid).update(
                      {
                        "participants": FieldValue.arrayUnion([user.uid])
                      },
                    );
                  } catch (e) {
                    print(e);
                  }
                }
                print(res);
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 6),
                          blurRadius: 6.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, 1.0],
                      colors: [mmfOrange, mmfRed],
                    ),
                    color: mmfOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }
}
