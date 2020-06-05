import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Color color;
  final double width;

  Block(
    this.color,
    this.width,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: color,
      ),
    );
  }
}
