import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeAboutScreenDataGetter extends StatelessWidget {
  CommitteeAboutScreenDataGetter({this.committeeName});

  final String committeeName;
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection(committeeName).getDocuments(),
        builder: (context, snapshot) {
          List<Text> aboutWidget = [];
          if (snapshot.hasData) {
            final aboutData = snapshot.data.documents;
            for (var data in aboutData) {
              final dataAim = data.data;
              final aimWidget = Text(
                '$dataAim',
                style: kAboutPageDataTextStyle,
              );
              aboutWidget.add(aimWidget);
            }
          }
          return Column(
            children: aboutWidget,
          );
        },
      ),
    );
  }
}
