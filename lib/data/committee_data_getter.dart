import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/components/committee_members_card_creator.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeDataGetter extends StatefulWidget {
  CommitteeDataGetter(
      {@required this.committeeName, @required this.committeeDataType});

  final String committeeName;
  final String committeeDataType;

  @override
  _CommitteeDataGetterState createState() => _CommitteeDataGetterState();
}

class _CommitteeDataGetterState extends State<CommitteeDataGetter> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection(widget.committeeName).getDocuments(),
        builder: (context, snapshot) {
          List<Widget> requiredDetails = [];
          Widget child;
          if (snapshot.hasData) {
            final information = snapshot.data.documents;
            for (var document in information) {
              if (document.documentID == 'MEMBERS' &&
                  widget.committeeDataType == 'MEMBERS') {
                final postData = document.data;
                for (String post in postData.keys) {
                  final memberCards = CommitteeMembersCardCreator(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          post,
                          style: kAboutPageDataTextStyle,
                        ),
                        Text(
                          postData[post],
                          style: kAboutPageAboutTextStyle,
                        ),
                      ],
                    ),
                  );
                  requiredDetails.add(memberCards);
                }
                child = Container(
                  child: Column(
                    children: requiredDetails,
                  ),
                );
              } else if (document.documentID == 'ABOUT' &&
                  widget.committeeDataType == 'ABOUT') {
                final aboutCommittee = document.data;
                final committeeAboutData = Text(
                  aboutCommittee['ABOUT'],
                  style: kAboutPageDataTextStyle,
                );
                requiredDetails.add(committeeAboutData);
                child = committeeAboutData;
              }
            }
          } else {
            child = Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade700,
                strokeWidth: 6,
              ),
            );
          }
          return child;
        },
      ),
    );
  }
}
