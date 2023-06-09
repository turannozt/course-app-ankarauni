// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AllConfettiWidget extends StatefulWidget {
  final Widget child;

  const AllConfettiWidget({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  _AllConfettiWidgetState createState() => _AllConfettiWidgetState();
}

class _AllConfettiWidgetState extends State<AllConfettiWidget> {
  late ConfettiController controller;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 5));
    controller.play();
  }

  static const double left = pi;

  final double blastDirection = left;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.state == ConfettiControllerState.playing) {
          controller.stop();
        } else {
          controller.play();
        }
      },
      child: Stack(
        children: [
          widget.child,
          buildConfetti(),
        ],
      ),
    );
  }

  Widget buildConfetti() => Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: controller,
          colors: const [
            Colors.red,
            Colors.blue,
            Colors.orange,
            Colors.purple,
            Colors.lightBlue,
          ],
          //blastDirection: blastDirection,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: true,
          emissionFrequency: 0.05,
          numberOfParticles: 5,
          gravity: 0.2,
          maxBlastForce: 2,
          minBlastForce: 1,
          particleDrag: 0.1,
        ),
      );
}
