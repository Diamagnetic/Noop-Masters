import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LinkCreator extends StatelessWidget {
  LinkCreator({@required this.committeeLink});
  final String committeeLink;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Card(
        color: kAppbarBackgroundColour,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: FlatButton(
          onPressed: _launchURL(committeeLink),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          splashColor: Colors.grey.withOpacity(.3),
          child: Center(
            child: Text(
              'SOCIAL',
              style: kCardTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(String committeeLink) async {
  String url = committeeLink;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// String link;
// if( CommitteeButtonCreator(committeeName :'TECHNOVANZA')==true){
//      link ='https://www.instagram.com/technovanza/';
//   }else if (CommitteeButtonCreator(committeeName :'ENTHUSIA')==true){
//     link ='https://www.instagram.com/pratibimbvjti/';
