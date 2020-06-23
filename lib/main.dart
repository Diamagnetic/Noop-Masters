import 'package:flutter/material.dart';
import 'package:vjcommittee/screens/committee_selection_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommitteeSelectionScreen(),
      theme: ThemeData(
        accentColor: Colors.grey,
        accentColorBrightness: Brightness.light,
      ),
    );
  }
}
