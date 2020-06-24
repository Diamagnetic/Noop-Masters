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
          CommitteeButtonCreator(
            committeeLogo: 'images/pratibimb_logo.jpg',
            committeeName: 'PRATIBIMB',
          ),
          CommitteeButtonCreator(
            committeeName: 'ENTHUSIA',
            committeeLogo: 'images/enthusia_logo.jpg',
          ),
          CommitteeButtonCreator(
            committeeName: 'ECELL',
            committeeLogo: 'images/ecell_logo.png',
          ),
          CommitteeButtonCreator(
            committeeName: 'COC',
            committeeLogo: 'images/coc_logo.jpg',
          ),
          CommitteeButtonCreator(
            committeeName: 'SRA',
            committeeLogo: 'images/sra_logo.png',
          ),
          CommitteeButtonCreator(
            committeeName: 'AERO VJTI',
            committeeLogo: 'images/aerovjti_logo.png',
          ),
          CommitteeButtonCreator(
            committeeName: 'DLA',
            committeeLogo: 'images/dla_logo.png',
          ),
        ],
      ),
    );
  }
}
