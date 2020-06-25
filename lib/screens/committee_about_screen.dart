import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vjcommittee/constants.dart';

class CommitteAboutScreen extends StatelessWidget {
  CommitteAboutScreen(
      {@required this.committeeLogo, @required this.committeeName});

  final _firestore = Firestore.instance;
  final String committeeName;
  final String committeeLogo;
  List abtData = [];

  void getData() async {
    final dt = await _firestore.collection('ecellabt').getDocuments();
    for (var message in dt.documents) abtData = message.data.values;
  }

  String storeData() {
    for (int i in abtData) return (abtData[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(.7),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            committeeName,
            style: kAppbarTitleTextStyle,
          ),
          backgroundColor: kBackgroundColour,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  committeeLogo,
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.3),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'ABOUT',
                    style: kCardTitleTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
