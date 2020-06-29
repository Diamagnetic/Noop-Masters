import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeMembersScreenDataGetter extends StatefulWidget {
  final int index;

  CommitteeMembersScreenDataGetter(this.index, {@required this.committeeName});

  final String committeeName;

  @override
  _CommitteeMembersScreenDataGetterState createState() =>
      _CommitteeMembersScreenDataGetterState();
}

class _CommitteeMembersScreenDataGetterState
    extends State<CommitteeMembersScreenDataGetter> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore
            .collection(widget.committeeName)
            .orderBy('created', descending: true)
            .getDocuments(),
        builder: (context, snapshot) {
          List<Column> aboutWidget = [];
          if (snapshot.hasData) {
            final aboutData = snapshot.data.documents;
            for (var data in aboutData) {
              final dataPost = data.data;
              for (String post in dataPost.keys) {
                final aimWidget = Column(
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
                );
                aboutWidget.add(aimWidget);
              }
            }
          }
          return aboutWidget[widget.index];
        },
      ),
    );
  }
}
