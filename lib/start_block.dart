import 'package:flutter/material.dart';
import 'package:ludo/block.dart';

class StartBlock extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry margin;
  final double blockWidth;

  StartBlock({
    @required this.color,
    @required this.margin,
    @required this.blockWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Block(
        color: color,
        width: blockWidth,
        icon: Icon(Icons.stars),
      ),
    );
  }
}
