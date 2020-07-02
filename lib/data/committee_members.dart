import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/components/committee_members_card_creator.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeMembersDataGetter extends StatefulWidget {
  CommitteeMembersDataGetter({@required this.committeeName});

  final String committeeName;

  @override
  _CommitteeMembersDataGetterState createState() =>
      _CommitteeMembersDataGetterState();
}

class _CommitteeMembersDataGetterState
    extends State<CommitteeMembersDataGetter> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection(widget.committeeName).getDocuments(),
        builder: (context, snapshot) {
          List<CommitteeMembersCardCreator> memberDetails = [];
          Widget child;
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
                child = Container(
                  child: Column(
                    children: memberDetails,
                  ),
                );

              }
            }
          } else {
            child = Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.grey.shade700,
              strokeWidth: 6,
            ));
          }
          return child;
        },
      ),
    );
  }
}
