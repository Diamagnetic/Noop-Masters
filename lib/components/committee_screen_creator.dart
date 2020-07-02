import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'package:vjcommittee/screens/committee_about_screen.dart';
import 'package:vjcommittee/screens/committee_join_screen.dart';
import 'package:vjcommittee/screens/committee_members_screen.dart';
import 'package:vjcommittee/screens/instaLink.dart';

class CommitteeScreenCreator extends StatefulWidget {
  CommitteeScreenCreator(
      {@required this.committeeName,
      @required this.committeeLogo,
      @required this.committeeLink});

  final String committeeName;
  final String committeeLogo;
  final String committeeLink;

  @override
  _CommitteeScreenCreatorState createState() => _CommitteeScreenCreatorState();
}

class _CommitteeScreenCreatorState extends State<CommitteeScreenCreator>
    with TickerProviderStateMixin {
  void _openScreen(Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, _) {
          return screen;
        },
        transitionsBuilder: (context, animation, _, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation.drive(
                Tween(begin: 1.5, end: 1.0).chain(
                  CurveTween(curve: Curves.easeOutCubic),
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(.7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.committeeName,
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
                  widget.committeeLogo,
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
                    _openScreen(
                      CommitteeAboutScreenCreator(
                        committeeLogo: widget.committeeLogo,
                        committeeName: widget.committeeName,
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'SOCIAL',
                  onPressed: () {
                    _openScreen(
                      LinkCreator(
                        committeeLink: widget.committeeLink,
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'COMMITTEE MEMBERS',
                  onPressed: () {
                    _openScreen(
                      CommitteeMembersScreen(
                        committeeLogo: widget.committeeLogo,
                        committeeName: widget.committeeName,
                      ),
                    );
                  },
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'JOIN',
                  onPressed: () {
                    _openScreen(
                      CommitteeJoinScreen(
                        committeeLogo: widget.committeeLogo,
                        committeeName: widget.committeeName,
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
