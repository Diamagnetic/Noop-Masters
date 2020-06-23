import 'package:flutter/material.dart';

import '../constants.dart';

class CommitteeScreenCreator extends StatelessWidget {
  final String committeeName;
  final String committeeLogo;

  CommitteeScreenCreator(
      {@required this.committeeName, @required this.committeeLogo});

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
            height: 400,
            margin: EdgeInsets.all(25),
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 4,
              children: <Widget>[
                CardCreator(
                  cardTitle: 'ABOUT',
                ),
                SizedBox(),
                CardCreator(
                  cardTitle: 'COMMITTEE MEMBERS',
                ),
                //TODO: CardCreator class creates a card for each field of the committee. Just add a SizedBox() with no properties before creating a new card.
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

  CardCreator({@required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColour,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: FlatButton(
        onPressed: () {
//          Functionality will be added soon
        },
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
