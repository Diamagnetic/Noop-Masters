import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommitteeSocialPage extends StatefulWidget {
  CommitteeSocialPage({@required this.committeeInstagramLink});

  final String committeeInstagramLink;

  @override
  _CommitteeSocialPageState createState() => _CommitteeSocialPageState();
}

class _CommitteeSocialPageState extends State<CommitteeSocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SOCIAL',
          style: kAppbarTitleTextStyle,
        ),
        backgroundColor: kAppbarBackgroundColour,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.committeeInstagramLink,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
