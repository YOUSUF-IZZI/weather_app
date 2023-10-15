import 'dart:ui';
import 'package:flutter/material.dart';


class BlurryBackground extends StatelessWidget {
  const BlurryBackground({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(2,-0.1),
            child: Container(
              height: 300, width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-2,-0.1),
            child: Container(
              height: 300, width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0,-1.2),
            child: Container(
              height: 350, width: 350,
              decoration: const BoxDecoration(
                //shape: BoxShape.circle,
                  color: Colors.blue
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.transparent
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}