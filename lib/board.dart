import 'package:flutter/material.dart';
import 'package:ludo/block.dart';
import 'package:ludo/home_lane.dart';
import 'package:ludo/model/position.dart';
import 'package:ludo/rest_area.dart';
import 'package:ludo/start_block.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var totalWidth = mediaQuery.size.width;
    var blockWidth = totalWidth / 15;

    Widget _buildRow(int row) {
      List<Widget> rowWidgets = [];
      final starPositions = [
        Position(2, 6),
        Position(6, 12),
        Position(8, 2),
        Position(12, 8)
      ];

      bool isStar(row, col) {
        int index = starPositions
            .indexWhere((element) => element.row == row && element.col == col);
        return index > -1;
      }

      for (var column = 0; column < 15; column++) {
        isStar(row, column)
            ? rowWidgets.insert(
                column,
                Block(
                  color: Colors.white,
                  width: blockWidth,
                  icon: Icon(Icons.stars),
                ))
            : rowWidgets.insert(
                column, Block(color: Colors.white, width: blockWidth));
      }
      return Row(
        children: rowWidgets,
      );
    }

    Widget _buildBoard() {
      List<Widget> columnWidgets = [];
      for (var row = 0; row < 15; row++) {
        columnWidgets.insert(row, _buildRow(row));
      }
      return Column(
        children: columnWidgets,
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
                StartBlock(
                  color: Colors.red,
                  margin: EdgeInsets.fromLTRB(0, blockWidth * 4, 0, blockWidth),
                  blockWidth: blockWidth,
                ),
                HomeLane(
                  color: Colors.red,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, blockWidth),
                  isVertical: true,
                  mainAxisAlignment: MainAxisAlignment.end,
                  blockWidth: blockWidth,
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
                StartBlock(
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(blockWidth, 0, blockWidth * 4, 0),
                  blockWidth: blockWidth,
                ),
                HomeLane(
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(blockWidth, 0, 0, 0),
                  isVertical: false,
                  mainAxisAlignment: MainAxisAlignment.start,
                  blockWidth: blockWidth,
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
                HomeLane(
                  color: Colors.green,
                  margin: EdgeInsets.fromLTRB(blockWidth * 7, blockWidth, 0, 0),
                  isVertical: true,
                  mainAxisAlignment: MainAxisAlignment.start,
                  blockWidth: blockWidth,
                ),
                StartBlock(
                  color: Colors.green,
                  margin: EdgeInsets.fromLTRB(0, blockWidth, 0, blockWidth),
                  blockWidth: blockWidth,
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
                HomeLane(
                  color: Colors.yellow,
                  margin: EdgeInsets.fromLTRB(blockWidth * 9, 0, 0, 0),
                  isVertical: false,
                  mainAxisAlignment: MainAxisAlignment.start,
                  blockWidth: blockWidth,
                ),
                StartBlock(
                  color: Colors.yellow,
                  margin:
                      EdgeInsets.fromLTRB(blockWidth * 11, 0, blockWidth, 0),
                  blockWidth: blockWidth,
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
