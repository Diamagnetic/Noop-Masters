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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/app_logo.png',
            ),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.25),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          padding: EdgeInsets.only(top: 20),
          mainAxisSpacing: 20,
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          children: <Widget>[
            CommitteeButtonCreator(
              committeeName: 'TECHNOVANZA',
              committeeLogo: 'images/technovanza_logo.JPG',
              committeeLink: 'https://www.instagram.com/technovanza/',
            ),
            CommitteeButtonCreator(
              committeeLogo: 'images/pratibimb_logo.jpg',
              committeeName: 'PRATIBIMB',
              committeeLink: 'https://www.instagram.com/pratibimbvjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'ENTHUSIA',
              committeeLogo: 'images/enthusia_logo.jpg',
              committeeLink: 'https://www.instagram.com/enthusiavjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'RANGAWARDHAN',
              committeeLogo: 'images/rangawardhan_logo.jpg',
              committeeLink: 'https://www.instagram.com/rangawardhan/',
            ),
            CommitteeButtonCreator(
              committeeName: 'ECELL',
              committeeLogo: 'images/ecell_logo.png',
              committeeLink: 'https://www.instagram.com/ecellvjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'COC',
              committeeLogo: 'images/coc_logo.jpg',
              committeeLink: 'https://www.instagram.com/coc_vjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'SRA',
              committeeLogo: 'images/sra_logo.jpg',
              committeeLink: 'https://www.instagram.com/sra_vjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'AERO VJTI',
              committeeLogo: 'images/aerovjti_logo.png',
              committeeLink: 'https://www.instagram.com/aerovjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'DLA',
              committeeLogo: 'images/dla_logo.png',
              committeeLink: 'https://www.instagram.com/dla_vjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'ENACTUS',
              committeeLogo: 'images/enactus_logo.jpg',
              committeeLink: 'https://www.instagram.com/enactusvjti/',
            ),
            CommitteeButtonCreator(
              committeeName: 'IEEE',
              committeeLogo: 'images/ieee_logo.png',
              committeeLink: 'https://www.instagram.com/ieeevjti/',
            )
          ],
        ),
      ),
    );
  }
}
