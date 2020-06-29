import 'package:flutter/material.dart';
import 'package:vjcommittee/constants.dart';
import 'committee_screen_creator.dart';

class CommitteeButtonCreator extends StatelessWidget {
  final String committeeName;
  final String committeeLogo;

  CommitteeButtonCreator({
    @required this.committeeName,
    @required this.committeeLogo,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonAnimation(
          committeeName: committeeName,
          committeeLogo: committeeLogo,
        ),
        Center(
          child: Text(
            committeeName,
            style: kCommitteeButtonTextStyle,
          ),
        ),
      ],
    );
  }
}

class ButtonAnimation extends StatefulWidget {
  final String committeeLogo;
  final String committeeName;

  ButtonAnimation({this.committeeName, this.committeeLogo});

  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {
  void _openCommitteePage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, _) {
          return CommitteeScreenCreator(
              committeeName: widget.committeeName,
              committeeLogo: widget.committeeLogo);
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

  AnimationController _controller;
  Animation _animation;

  double _buttonSizeMultiplier = 1;

  void _committeeButtonAnimator() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: .99,
      upperBound: 1,
    );
    _animation = CurveTween(curve: Curves.linear).animate(_controller);

    _controller.forward();

    _animation.addListener(() {
      setState(() {
        _buttonSizeMultiplier = _animation.value;
      });
    });
    _openCommitteePage(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: .8 * _buttonSizeMultiplier,
        heightFactor: .9 * _buttonSizeMultiplier,
        child: GestureDetector(
          onTap: () {
            _committeeButtonAnimator();
          },
          child: ButtonPainting(
            committeeLogo: widget.committeeLogo,
          ),
        ),
      ),
    );
  }
}

class ButtonPainting extends StatelessWidget {
  final String committeeLogo;

  ButtonPainting({
    @required this.committeeLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            committeeLogo,
          ),
          fit: BoxFit.fill,
        ),
        color: Colors.black54,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            blurRadius: 7,
          ),
        ],
      ),
    );
  }
}
