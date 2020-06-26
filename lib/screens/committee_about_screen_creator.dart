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

//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  void getData() async {
//    final data = await _firestore.collection('ecellabt').getDocuments();
//    for (var info in data.documents) {
//      print(info.data);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection('ecellabt').getDocuments(),
        builder: (context, fullData) {
          List<Text> aboutWidget = [];
          if (fullData.hasData) {
            final aboutData = fullData.data.documents;
            for (var data in aboutData) {
              final dataAim = data.data['aim'];
              final dataAimData = data.data['initiatives'];
              final aimWidget = Text(
                '$dataAim \n $dataAimData',
                textScaleFactor: 1.5,
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
