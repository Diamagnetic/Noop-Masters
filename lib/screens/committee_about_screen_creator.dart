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
              child: CommitteeAboutScreenDataGetter(),
            ),
          ],
        ),
      ),
    );
  }
}

class CommitteeAboutScreenDataGetter extends StatefulWidget {
  @override
  _CommitteeAboutScreenDataGetterState createState() =>
      _CommitteeAboutScreenDataGetterState();
}

class _CommitteeAboutScreenDataGetterState
    extends State<CommitteeAboutScreenDataGetter> {
  final _firestore = Firestore.instance;
  List abtData = [];

  void getData() async {
    final dt = await _firestore.collection('ecellabt').getDocuments();
    for (var message in dt.documents) {
      abtData = message.data.values;
    }
  }

  String storeData() {
    for (int i in abtData) {
      return (abtData[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      storeData(),
      style: kAboutPageAboutTextStyle,
    );
  }
}
