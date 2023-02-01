import 'dart:async';

import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  Widget child;
  int duration;
  MyAnimation({Key? key,required this.child, required this.duration}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;


  initAnmiation(){
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000)
    );
    final curve = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationOffset = Tween<Offset>(
        begin: const Offset(0.0, 3),
        end: Offset.zero
    ).animate(curve);
    Timer(Duration(milliseconds: widget.duration), () {
      animationController.forward();
    });

  }

  closeAnimation(){
    animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    initAnmiation();
    super.initState();
  }


  @override
  void dispose() {
    closeAnimation();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animationController,
        child: SlideTransition(
          position: animationOffset,
          child: widget.child,
        )
    );
  }
}
