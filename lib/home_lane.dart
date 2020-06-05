import 'package:flutter/material.dart';
import 'package:ludo/block.dart';

class HomeLane extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry margin;
  final bool isVertical;
  final MainAxisAlignment mainAxisAlignment;
  final double blockWidth;

  HomeLane({
    @required this.color,
    @required this.margin,
    @required this.isVertical,
    @required this.mainAxisAlignment,
    @required this.blockWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: isVertical
          ? Column(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
              ],
            )
          : Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
                Block(color: color, width: blockWidth),
              ],
            ),
    );
  }
}
