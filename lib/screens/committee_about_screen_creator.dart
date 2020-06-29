import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeAboutScreenCreator extends StatelessWidget {
  final String committeeLogo;
  final String committeeName;

  CommitteeAboutScreenCreator(
      {@required this.committeeLogo, @required this.committeeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(committeeLogo),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 15, right: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment(-.95, 0),
                    child: Text(
                      committeeName,
                      style: kAboutPageCommitteeTextStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment(-.95, 0),
                    child: Text(
                      'About',
                      style: kAboutPageAboutTextStyle,
                    ),
                  ),
                  Divider(
                    indent: 7.5,
                    endIndent: 300,
                    thickness: 1.2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment(-.95, 0),
              child: CommitteeAboutScreenDataGetter(
                committeeName: committeeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommitteeAboutScreenDataGetter extends StatefulWidget {
  final String committeeName;

  CommitteeAboutScreenDataGetter({@required this.committeeName});

  @override
  _CommitteeAboutScreenDataGetterState createState() =>
      _CommitteeAboutScreenDataGetterState();
}

class _CommitteeAboutScreenDataGetterState
    extends State<CommitteeAboutScreenDataGetter> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection('IEEE').getDocuments(),
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
