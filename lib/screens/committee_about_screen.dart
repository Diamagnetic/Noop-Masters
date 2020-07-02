import 'package:flutter/material.dart';
import 'package:vjcommittee/data/committee_about.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeAboutScreenCreator extends StatefulWidget {
  CommitteeAboutScreenCreator(
      {@required this.committeeLogo, @required this.committeeName});

  final String committeeLogo;
  final String committeeName;

  @override
  _CommitteeAboutScreenCreatorState createState() =>
      _CommitteeAboutScreenCreatorState();
}

class _CommitteeAboutScreenCreatorState
    extends State<CommitteeAboutScreenCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(widget.committeeLogo),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 15, right: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment(-.95, 0),
                    child: Text(
                      widget.committeeName,
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
                committeeName: widget.committeeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}