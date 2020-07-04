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
  CollectionReference _committeeDetails;

  @override
  void initState() {
    super.initState();
    if (widget.committeeDataType == 'MEMBERS') {
      _committeeDetails = _firestore
          .collection(widget.committeeName)
          .document('MEMBERS')
          .collection('MEMBERS');
    } else if (widget.committeeDataType == 'ABOUT') {
      _committeeDetails = _firestore.collection(widget.committeeName);
    }
  }

  Widget _widget(AsyncSnapshot<QuerySnapshot> snapshot) {
    Widget _child;
    if (snapshot.hasData) {
      final information = snapshot.data.documents;
      List<Widget> requiredDetails = [];
      for (var document in information) {
        if (widget.committeeDataType == 'MEMBERS') {
          final committeeData = document.data;
          for (var member in committeeData.values) {
            final memberCards = CommitteeMembersCardCreator(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    document.documentID,
                    textAlign: TextAlign.center,
                    style: kMembersPagePostTextStyle,
                  ),
                  Text(
                    member,
                    textAlign: TextAlign.center,
                    style: kMembersPageMemberTextStyle,
                  ),
                ],
              ),
            );
            requiredDetails.add(memberCards);
          }
          _child = Container(
            child: Column(
              children: requiredDetails,
            ),
          );
        } else if (widget.committeeDataType == 'ABOUT' &&
            document.documentID == 'ABOUT') {
          final committeeData = document.data;
          final committeeAboutData = Text(
            committeeData['ABOUT'],
            style: kAboutPageDataTextStyle,
          );
          _child = committeeAboutData;
        }
      }
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      _child = Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey.shade700,
          strokeWidth: 6,
        ),
      );
    } else {
      _child = Container(
        child: Text(
          'ERROR',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 30,
          ),
        ),
      );
    }
    return _child;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<QuerySnapshot>(
        future: _committeeDetails.getDocuments(),
        builder: (context, snapshot) {
          Widget child = _widget(snapshot);
          return child;
        },
      ),
    );
  }
}
