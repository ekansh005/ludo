import 'package:flutter/material.dart';
import 'package:ludo/block.dart';

class RestArea extends StatelessWidget {
  final Color color;
  final double blockWidth;

  RestArea(this.color, this.blockWidth);

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);

    return Container(
      width: blockWidth * 6,
      height: blockWidth * 6,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: color,
      ),
      child: Container(
        margin: EdgeInsets.all(blockWidth),
        padding: EdgeInsets.all(blockWidth / 2),
        width: blockWidth * 4,
        height: blockWidth * 4,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Block(color, blockWidth),
                Block(color, blockWidth)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Block(color, blockWidth),
                Block(color, blockWidth)
              ],
            )
          ],
        ),
      ),
    );
  }
}
