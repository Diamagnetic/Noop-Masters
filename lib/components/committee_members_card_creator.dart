import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeMembersCardCreator extends StatelessWidget {
  final Column child;

  CommitteeMembersCardCreator({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCardBackgroundColour,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            blurRadius: 7,
          ),
        ],
      ),
    );
  }
}
