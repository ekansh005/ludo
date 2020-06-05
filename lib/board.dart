import 'package:flutter/material.dart';
import 'package:ludo/block.dart';
import 'package:ludo/rest_area.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var totalWidth = mediaQuery.size.width;
    var blockWidth = totalWidth / 15;
    Widget _buildBlock(int row, int col) {
      return Container(
        width: blockWidth,
        height: blockWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
      );
    }

    Widget _buildRow(int row) {
      List<Widget> rowWidgets = [];
      for (var i = 0; i < 15; i++) {
        rowWidgets.insert(i, _buildBlock(row, i));
      }
      return Row(
        children: rowWidgets,
      );
    }

    Widget _buildBoard() {
      List<Widget> columnWidgets = [];
      for (var i = 0; i < 15; i++) {
        columnWidgets.insert(i, _buildRow(i));
      }
      return Column(
        children: columnWidgets,
      );
    }

    Container buildHomeLane(Color color, EdgeInsetsGeometry margin,
        bool isVertical, MainAxisAlignment mainAxisAlignment) {
      return Container(
        margin: margin,
        child: isVertical
            ? Column(
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                ],
              )
            : Row(
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                  Block(color, blockWidth),
                ],
              ),
      );
    }

    Container buildStartBlock(Color color, EdgeInsetsGeometry margin) {
      return Container(
        margin: margin,
        child: Block(color, blockWidth),
      );
    }

    return Container(
      width: blockWidth * 15,
      height: blockWidth * 15,
      child: Stack(
        children: <Widget>[
          _buildBoard(),
          Container(
            alignment: Alignment.bottomLeft,
            width: blockWidth * 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RestArea(Colors.red, blockWidth),
                buildStartBlock(
                  Colors.red,
                  EdgeInsets.fromLTRB(0, blockWidth * 4, 0, blockWidth),
                ),
                buildHomeLane(
                  Colors.red,
                  EdgeInsets.fromLTRB(0, 0, 0, blockWidth),
                  true,
                  MainAxisAlignment.end,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: blockWidth * 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RestArea(Colors.blue, blockWidth),
                buildStartBlock(
                  Colors.blue,
                  EdgeInsets.fromLTRB(blockWidth, 0, blockWidth * 4, 0),
                ),
                buildHomeLane(
                  Colors.blue,
                  EdgeInsets.fromLTRB(blockWidth, 0, 0, 0),
                  false,
                  MainAxisAlignment.start,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            width: blockWidth * 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildHomeLane(
                  Colors.green,
                  EdgeInsets.fromLTRB(blockWidth * 7, blockWidth, 0, 0),
                  true,
                  MainAxisAlignment.start,
                ),
                buildStartBlock(
                  Colors.green,
                  EdgeInsets.fromLTRB(0, blockWidth, 0, blockWidth),
                ),
                RestArea(Colors.green, blockWidth),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            height: blockWidth * 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                buildHomeLane(
                  Colors.yellow,
                  EdgeInsets.fromLTRB(blockWidth * 9, 0, 0, 0),
                  false,
                  MainAxisAlignment.start,
                ),
                buildStartBlock(
                  Colors.yellow,
                  EdgeInsets.fromLTRB(blockWidth * 11, 0, blockWidth, 0),
                ),
                RestArea(Colors.yellow, blockWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
