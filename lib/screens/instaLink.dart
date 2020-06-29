import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class linkCreator extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kAppbarBackgroundColour,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: FlatButton(
        onPressed: _launchURL ,
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
    );
  }
}

_launchURL() async {
  
    String url = 'https://www.instagram.com/technovanza/';
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

  