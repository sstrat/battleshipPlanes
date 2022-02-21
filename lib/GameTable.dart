import 'package:flutter/material.dart';
import 'package:planes_battle/MyCell.dart';
import 'package:planes_battle/Piece.dart';
import 'package:planes_battle/Plane.dart';
import 'MyContainer.dart';
import 'dart:math';
import 'Piece.dart';

class GameTable extends StatefulWidget {
  GameTable({Key? key, this.planeTable = const []}) : super(key: key);
  Size size = Size.zero;
  List<List<MyCell>> planeTable =
      List.generate(11, (i) => List.generate(11, (j) => MyCell()));
  _GameTableState createState() => _GameTableState();
}

class _GameTableState extends State<GameTable> {
  //int n = 11;

  // List<List<MyCell>> this.widget.planeTable =
  //     List.generate(11, (i) => List.generate(11, (j) => MyCell()));

  bool isPressed = false;

  List<List<int>> convertToIntMat(List<List<MyCell>> matrix) {
    List<List<int>> result =
        List.generate(11, (i) => List.generate(11, (j) => 0));
    ;
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        result[i][j] = matrix[i][j].val;
      }
    }
    return result;
  }

  bool isOkToPut(int orientation, int i, int j) {
    if (orientation == 0) {
      if (i < 2 || i > 8 || j < 3 || j > 8) {
        return false;
      }
    } else if (orientation == 1) {
      if (i < 3 || i > 8 || j < 3 || j > 9) {
        return false;
      }
    } else if (orientation == 2) {
      if (i < 3 || i > 9 || j < 3 || j > 8) {
        return false;
      }
    } else if (orientation == 3) {
      if (i < 3 || i > 8 || j < 2 || j > 8) {
        return false;
      }
    }

    if (orientation == 0) {
      if (this.widget.planeTable[i][j].val == 1 ||
          this.widget.planeTable[i + 1][j].val == 1 ||
          this.widget.planeTable[i - 1][j].val == 1 ||
          this.widget.planeTable[i][j + 1].val == 1 ||
          this.widget.planeTable[i][j - 1].val == 1 ||
          this.widget.planeTable[i][j + 2].val == 1 ||
          this.widget.planeTable[i][j - 2].val == 1 ||
          this.widget.planeTable[i + 2][j].val == 1 ||
          this.widget.planeTable[i + 2][j + 1].val == 1 ||
          this.widget.planeTable[i + 2][j - 1].val == 1) {
        return false;
      }
    } else if (orientation == 1) {
      if (this.widget.planeTable[i][j].val == 1 ||
          this.widget.planeTable[i][j + 1].val == 1 ||
          this.widget.planeTable[i - 1][j].val == 1 ||
          this.widget.planeTable[i - 2][j].val == 1 ||
          this.widget.planeTable[i + 1][j].val == 1 ||
          this.widget.planeTable[i + 2][j].val == 1 ||
          this.widget.planeTable[i][j - 1].val == 1 ||
          this.widget.planeTable[i][j - 2].val == 1 ||
          this.widget.planeTable[i - 1][j - 2].val == 1 ||
          this.widget.planeTable[i + 1][j - 2].val == 1) {
        return false;
      }
    } else if (orientation == 2) {
      if (this.widget.planeTable[i][j].val == 1 ||
          this.widget.planeTable[i - 1][j].val == 1 ||
          this.widget.planeTable[i + 1][j].val == 1 ||
          this.widget.planeTable[i][j + 1].val == 1 ||
          this.widget.planeTable[i][j - 1].val == 1 ||
          this.widget.planeTable[i][j + 2].val == 1 ||
          this.widget.planeTable[i][j - 2].val == 1 ||
          this.widget.planeTable[i - 2][j].val == 1 ||
          this.widget.planeTable[i - 2][j + 1].val == 1 ||
          this.widget.planeTable[i - 2][j - 1].val == 1) {
        return false;
      }
    } else if (orientation == 3) {
      if (this.widget.planeTable[i][j].val == 1 ||
          this.widget.planeTable[i][j - 1].val == 1 ||
          this.widget.planeTable[i - 1][j].val == 1 ||
          this.widget.planeTable[i - 2][j].val == 1 ||
          this.widget.planeTable[i + 1][j].val == 1 ||
          this.widget.planeTable[i + 2][j].val == 1 ||
          this.widget.planeTable[i][j + 1].val == 1 ||
          this.widget.planeTable[i][j + 2].val == 1 ||
          this.widget.planeTable[i - 1][j + 2].val == 1 ||
          this.widget.planeTable[i + 1][j + 2].val == 1) {
        return false;
      }
    }

    return true;
  }

  void putPlane(int orientation, int i, int j) {
    if (orientation == 0) {
      this.widget.planeTable[i][j].val = 1;
      this.widget.planeTable[i + 1][j].val = 1;
      this.widget.planeTable[i - 1][j].val = 1;
      this.widget.planeTable[i][j + 1].val = 1;
      this.widget.planeTable[i][j - 1].val = 1;
      this.widget.planeTable[i][j + 2].val = 1;
      this.widget.planeTable[i][j - 2].val = 1;
      this.widget.planeTable[i + 2][j].val = 1;
      this.widget.planeTable[i + 2][j + 1].val = 1;
      this.widget.planeTable[i + 2][j - 1].val = 1;

      this.widget.planeTable[i - 1][j].top1 = true;
      this.widget.planeTable[i - 1][j].top2 = true;
      this.widget.planeTable[i][j - 2].top1 = true;
      this.widget.planeTable[i][j + 2].top2 = true;
      this.widget.planeTable[i + 2][j + 1].top2 = true;
      this.widget.planeTable[i + 2][j - 1].top1 = true;
    } else if (orientation == 1) {
      this.widget.planeTable[i][j].val = 1;
      this.widget.planeTable[i][j + 1].val = 1;
      this.widget.planeTable[i - 1][j].val = 1;
      this.widget.planeTable[i - 2][j].val = 1;
      this.widget.planeTable[i + 1][j].val = 1;
      this.widget.planeTable[i + 2][j].val = 1;
      this.widget.planeTable[i][j - 1].val = 1;
      this.widget.planeTable[i][j - 2].val = 1;
      this.widget.planeTable[i - 1][j - 2].val = 1;
      this.widget.planeTable[i + 1][j - 2].val = 1;

      this.widget.planeTable[i][j + 1].top2 = true;
      this.widget.planeTable[i][j + 1].bot2 = true;
      this.widget.planeTable[i - 2][j].top2 = true;
      this.widget.planeTable[i + 2][j].bot2 = true;
      this.widget.planeTable[i - 1][j - 2].top2 = true;
      this.widget.planeTable[i + 1][j - 2].bot2 = true;
    } else if (orientation == 2) {
      this.widget.planeTable[i][j].val = 1;
      this.widget.planeTable[i - 1][j].val = 1;
      this.widget.planeTable[i + 1][j].val = 1;
      this.widget.planeTable[i][j + 1].val = 1;
      this.widget.planeTable[i][j - 1].val = 1;
      this.widget.planeTable[i][j + 2].val = 1;
      this.widget.planeTable[i][j - 2].val = 1;
      this.widget.planeTable[i - 2][j].val = 1;
      this.widget.planeTable[i - 2][j + 1].val = 1;
      this.widget.planeTable[i - 2][j - 1].val = 1;

      this.widget.planeTable[i + 1][j].bot1 = true;
      this.widget.planeTable[i + 1][j].bot2 = true;
      this.widget.planeTable[i][j - 2].bot1 = true;
      this.widget.planeTable[i][j + 2].bot2 = true;
      this.widget.planeTable[i - 2][j + 1].bot2 = true;
      this.widget.planeTable[i - 2][j - 1].bot1 = true;
    } else if (orientation == 3) {
      this.widget.planeTable[i][j].val = 1;
      this.widget.planeTable[i][j - 1].val = 1;
      this.widget.planeTable[i - 1][j].val = 1;
      this.widget.planeTable[i - 2][j].val = 1;
      this.widget.planeTable[i + 1][j].val = 1;
      this.widget.planeTable[i + 2][j].val = 1;
      this.widget.planeTable[i][j + 1].val = 1;
      this.widget.planeTable[i][j + 2].val = 1;
      this.widget.planeTable[i - 1][j + 2].val = 1;
      this.widget.planeTable[i + 1][j + 2].val = 1;

      this.widget.planeTable[i][j - 1].top1 = true;
      this.widget.planeTable[i][j - 1].bot1 = true;
      this.widget.planeTable[i - 2][j].top1 = true;
      this.widget.planeTable[i + 2][j].bot1 = true;
      this.widget.planeTable[i - 1][j + 2].top1 = true;
      this.widget.planeTable[i + 1][j + 2].bot1 = true;
    }
  }

  void printM(List<List<int>> numb) {
    for (int i = 0; i < numb.length; i++) {
      print(
          "${numb[i][1]} ${numb[i][2]} ${numb[i][3]} ${numb[i][4]} ${numb[i][5]} ${numb[i][6]} ${numb[i][7]} ${numb[i][8]} ${numb[i][9]} ${numb[i][10]}");
    }
  }

  List<List<int>> nr = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];

    List<TableRow> rows = [];
    List<Widget> cont = [];

    for (int i = 0; i < this.widget.planeTable.length; i++) {
      if (i == 0) {
        cont.add(AspectRatio(
            aspectRatio: 1,
            child: InkWell(
                onTap: () {
                  print(i.toString());
                },
                child: Container(
                  child: Center(child: Text("")),
                ))));
      } else {
        cont.add(Center(
            child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  child: Text(String.fromCharCode(i + 64)),
                  //color: Colors.blue,
                  alignment: Alignment.center,
                  //height: 15,
                  //width: 23,
                ))));
      }
    }
    rows.add(TableRow(children: cont));
    cont = [];

    Color _colorContainer = Colors.white;

    for (int i = 1; i < this.widget.planeTable.length; i++) {
      for (int j = 0; j < this.widget.planeTable[i].length; j++) {
        if (j == 0) {
          cont.add(
            AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                child: Center(child: Text(i.toString())),
                //color: Colors.blue,
              ),
            ),
          );
        } else {
          isPressed = false;
          cont.add(AspectRatio(
            aspectRatio: 1,
            child: DragTarget<int>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                Piece p = Piece(
                  //key: _cardKey,
                  top1: this.widget.planeTable[i][j].top1,
                  top2: this.widget.planeTable[i][j].top2,
                  bot1: this.widget.planeTable[i][j].bot1,
                  bot2: this.widget.planeTable[i][j].bot2,
                  color: this.widget.planeTable[i][j].val == 1
                      ? Colors.grey.shade800
                      : Colors.transparent,
                );

                // print(this.widget.size);
                return p;
              },
              onAccept: (int orientation) {
                setState(() {
                  //this.widget.planeTable[i][j] = 1 - this.widget.planeTable[i][j];

                  //if(i-1 > 0 && j-2 > 0 && i+2 < this.widget.planeTable.length && j+2 < this.widget.planeTable.length ){
                  if (isOkToPut(orientation, i, j)) {
                    putPlane(orientation, i, j);
                  }

                  //}
                });
              },
            ),
          ));
        }
      }

      rows.add(TableRow(children: cont));
      cont = [];
    }

    //print(rows.toString());

    return Container(
      //color: Colors.white,
      padding: EdgeInsets.all(10),

      child: Table(
        //key: _cardKey,
        columnWidths: {
          0: FlexColumnWidth(0.5),
        },
        border: TableBorder(
          top: BorderSide.none,
          left: BorderSide.none,
          verticalInside: BorderSide(color: Colors.grey),
          horizontalInside: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),

        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rows,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
