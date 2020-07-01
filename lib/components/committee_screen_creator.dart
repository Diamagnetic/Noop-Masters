import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'package:vjcommittee/screens/committee_about_screen_creator.dart';
import 'package:vjcommittee/screens/committee_join_screen.dart';
import 'package:vjcommittee/screens/committee_members_screen.dart';
import 'package:vjcommittee/screens/instaLink.dart';

class CommitteeScreenCreator extends StatelessWidget {
  final String committeeName;
  final String committeeLogo;
  final String committeeLink;

  CommitteeScreenCreator(
      {@required this.committeeName,
      @required this.committeeLogo,
      @required this.committeeLink});

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
        backgroundColor: kAppbarBackgroundColour,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  committeeLogo,
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.7),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 350,
            height: 550,
            margin: EdgeInsets.all(25),
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 4,
              children: <Widget>[
                CardCreator(
                  cardTitle: 'ABOUT',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommitteeAboutScreenCreator(
                          committeeLogo: committeeLogo,
                          committeeName: committeeName,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'SOCIAL',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LinkCreator(
                          committeeLink: committeeLink,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'COMMITTEE MEMBERS',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommitteeMembersScreen(
                          committeeLogo: committeeLogo,
                          committeeName: committeeName,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'JOIN',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommitteeJoinScreen(
                          committeeLogo: committeeLogo,
                          committeeName: committeeName,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardCreator extends StatelessWidget {
  final String cardTitle;
  final Function onPressed;

  CardCreator({@required this.cardTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardBackgroundColour,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: FlatButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        splashColor: Colors.grey.withOpacity(.3),
        child: Center(
          child: Text(
            cardTitle,
            style: kCardTitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
