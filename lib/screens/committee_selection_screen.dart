import 'package:flutter/material.dart';
import 'package:vjcommittee/components/committee_button_creator.dart';
import 'package:vjcommittee/constants.dart';

class CommitteeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VJ COMMITTEE',
          style: kAppbarTitleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF424242),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children: <Widget>[
          CommitteeButtonCreator(
            committeeName: 'TECHNOVANZA',
            committeeLogo: 'images/technovanza_logo.JPG',
          ),
          //TODO: Add a new button here for every new committee created. All they require is Strings of name, logo.
        ],
      ),
    );
  }
}
