import 'package:flutter/material.dart';
import 'package:planes_battle/MyCell.dart';
import 'package:planes_battle/Piece.dart';
import 'MyContainer.dart';
import 'dart:math';
import 'Piece.dart';

class EnemyTable extends StatefulWidget {
  List<List<MyCell>> planeTable;

  EnemyTable({
    Key? key,
    this.planeTable = const [],
  }) : super(key: key);
  Size size = Size.zero;

  _EnemyTableState createState() => _EnemyTableState();
  bool isPressed = false;
}

List<List<int>> initMat(int n) {
  List<int> aux = [];
  List<List<int>> rez = [];

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      aux.add(0);
    }
    rez.add(aux);
    aux = [];
  }
  return rez;
}

class _EnemyTableState extends State<EnemyTable> {
  //int n = 11;

  //List.filled(11, List.filled(11, 0));
  //List<List<MyCell>> numbers =
  //  List.generate(11, (i) => List.generate(11, (j) => MyCell()));

  List<List<int>> nr = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];

    List<int> rowNumbers = [];

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
          cont.add(AspectRatio(
              aspectRatio: 1,
              child: Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      this.widget.planeTable[i][j].pressed =
                          !this.widget.planeTable[i][j].pressed;
                    });
                  },
                  child: Piece(
                      icon: this.widget.planeTable[i][j].pressed
                          ? (this.widget.planeTable[i][j].val == 1
                              ? Icon(Icons.close)
                              : Icon(Icons.circle_outlined))
                          : Icon(null)),
                ),
              )));
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
