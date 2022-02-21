// ignore: file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:planes_battle/Piece.dart';
import 'package:planes_battle/Plane.dart';
import 'GameTable.dart';
import 'EnemyTable.dart';
import 'dart:math';
import 'Plane.dart';
import 'package:planes_battle/MyCell.dart';

class GameRoute extends StatefulWidget {
  const GameRoute({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GameRoute> {
  final GlobalKey _cardKey = GlobalKey();

  List<List<MyCell>> yourMatrix =
      List.generate(11, (i) => List.generate(11, (j) => MyCell()));
  List<List<MyCell>> enemyMatrix =
      List.generate(11, (i) => List.generate(11, (j) => MyCell()));

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

  GameTable table = GameTable();

  Size cardSize = Size(0, 0);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getSize());
  }

  getSize() {
    RenderBox _cardBox =
        _cardKey.currentContext!.findRenderObject() as RenderBox;
    cardSize = _cardBox.size;
    //this.widget.size = _cardBox.size;
    //print(this.widget.size);

    setState(() {
      //this.widget.size = _cardBox.size;
    });
  }

  GameTable myTable = GameTable(
    planeTable: List.generate(11, (i) => List.generate(11, (j) => MyCell())),
  );

  Offset pointerOffset = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    yourMatrix = myTable.planeTable;
    enemyMatrix = myTable.planeTable;

    Size cellSize = Size(
        (2 * (cardSize.width - 20)) / 21, (2 * (cardSize.height - 20)) / 21);

    EnemyTable enemyTable = EnemyTable(
      planeTable: myTable.planeTable,
    );

    //List<List<int>> tableValues = table.planeTable;

    //print(table.size);

    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GameTable(key: _cardKey, planeTable: yourMatrix),
                  ),
                  //table,
                  enemyTable,
                  Piece(
                    top1: true,
                    top2: true,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          //Center(
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Listener(
                      onPointerHover: (PointerHoverEvent event) {
                        setState(() {
                          pointerOffset = event.localPosition;
                          // yourTable = table.planeTable;
                          //print(convertToIntMat(yourTable));
                          print("ddddd");
                        });
                      },
                      onPointerCancel: (PointerCancelEvent event) {
                        setState(() {});
                      },
                      child: Draggable<int>(

                          //dragAnchorStrategy: ,
                          child: Container(
                            child: Transform.rotate(
                              angle: 0,
                              child: Icon(Icons.flight, color: Colors.white),
                            ),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                          ),
                          data: 0,
                          feedback: Transform.translate(
                            offset: Offset(
                                -5 * cellSize.width / 2 + pointerOffset.dx,
                                -(4 * cellSize.height) / 2 +
                                    pointerOffset.dy +
                                    cellSize.height / 2),
                            child: Plane(color: Colors.black, size: cellSize),
                          )

                          //Plane(color: Colors.green, size: cellSize),

                          ),
                    ),
                    Listener(
                      onPointerHover: (PointerHoverEvent event) {
                        setState(() {
                          pointerOffset = event.localPosition;
                        });
                      },
                      child: Draggable<int>(
                          child: Container(
                            child: Transform.rotate(
                              angle: 90 * pi / 180,
                              child: Icon(Icons.flight, color: Colors.white),
                            ),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                          ),
                          data: 1,
                          feedback: Transform.translate(
                            offset: Offset(
                                -(5 * cellSize.width) / 2 +
                                    pointerOffset.dx -
                                    cellSize.width / 2,
                                -(4 * cellSize.height) / 2 + pointerOffset.dy),
                            child: Transform.rotate(
                              angle: pi / 2,
                              child: Plane(color: Colors.black, size: cellSize),
                            ),
                          )),
                    ),
                    Listener(
                      onPointerHover: (PointerHoverEvent event) {
                        setState(() {
                          pointerOffset = event.localPosition;
                        });
                      },
                      child: Draggable<int>(
                          child: Container(
                            child: Transform.rotate(
                              angle: 2 * 90 * pi / 180,
                              child: Icon(Icons.flight, color: Colors.white),
                            ),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                          ),
                          data: 2,
                          feedback: Transform.translate(
                            offset: Offset(
                                -(5 * cellSize.width) / 2 + pointerOffset.dx,
                                -(4 * cellSize.height) / 2 +
                                    pointerOffset.dy -
                                    cellSize.height / 2),
                            child: Transform.rotate(
                                angle: 2 * pi / 2,
                                child:
                                    Plane(color: Colors.black, size: cellSize)),
                          )),
                    ),
                    Listener(
                      onPointerHover: (PointerHoverEvent event) {
                        setState(() {
                          pointerOffset = event.localPosition;
                        });
                      },
                      child: Draggable<int>(
                          child: Container(
                            child: Transform.rotate(
                              angle: 3 * 90 * pi / 180,
                              child: Icon(Icons.flight, color: Colors.white),
                            ),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                          ),
                          data: 3,
                          feedback: Transform.translate(
                            offset: Offset(
                                -(5 * cellSize.width) / 2 +
                                    pointerOffset.dx +
                                    cellSize.width / 2,
                                -(4 * cellSize.height) / 2 + pointerOffset.dy),
                            child: Transform.rotate(
                                angle: 3 * pi / 2,
                                child:
                                    Plane(color: Colors.black, size: cellSize)),
                          )),
                    ),
                  ],

                  //),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Draggable<int>(
            data: 0,
            child: Icon(Icons.airplanemode_active),
            feedback:
                //Container(child:GameTable(),)
                Plane(
              color: Colors.green,
              size: cellSize,
            )
            /*FloatingActionButton(
      
          
          child: Icon(Icons.airplanemode_active),
        
        backgroundColor: Colors.grey,
        onPressed: (){},
      ),*/
            ),
        backgroundColor: Colors.grey,
        onPressed: () {},
      ),
    );
  }
}
