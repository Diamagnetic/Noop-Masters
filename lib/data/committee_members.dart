import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/components/committee_members_card_creator.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeMembersDataGetter extends StatelessWidget {
  final String committeeName;
  final Firestore _firestore = Firestore.instance;

  CommitteeMembersDataGetter({@required this.committeeName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection(committeeName).getDocuments(),
        builder: (context, snapshot) {
          List<CommitteeMembersCardCreator> memberDetails = [];
          if (snapshot.hasData) {
            final aboutData = snapshot.data.documents;
            for (var data in aboutData) {
              if (data.documentID == 'MEMBERS') {
                final dataPost = data.data;
                for (String post in dataPost.keys) {
                  final aimWidget = CommitteeMembersCardCreator(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          post,
                          style: kAboutPageDataTextStyle,
                        ),
                        Text(
                          dataPost[post],
                          style: kAboutPageAboutTextStyle,
                        ),
                      ],
                    ),
                  );
                  memberDetails.add(aimWidget);
                }
              }
            }
          }
          return Container(
            child: Column(
              children: memberDetails,
            ),
          );
        },
      ),
    );
  }
}
