// ignore: file_names
import 'package:flutter/material.dart';
import 'package:planes_battle/Piece.dart';
import 'package:planes_battle/Plane.dart';
import 'GameTable.dart';
import 'dart:math';
import 'Plane.dart';

class GameRoute extends StatefulWidget {
  const GameRoute({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GameRoute> {
  final GlobalKey _cardKey = GlobalKey();
  Size cardSize = Size(0,0);
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) =>getSize());
  }

  getSize(){
    
    RenderBox _cardBox = _cardKey.currentContext!.findRenderObject() as RenderBox;
    cardSize = _cardBox.size;
    //this.widget.size = _cardBox.size;
   //print(this.widget.size);
   setState(() {
     //this.widget.size = _cardBox.size;
   });
  }
  Offset pointerOffset = Offset(0,0);
  @override
  Widget build(BuildContext context) {
    
    Size cellSize = Size((2*(cardSize.width-20))/21, (2*(cardSize.height-20))/21);
   
    GameTable table = GameTable(key: _cardKey,);
    //print(table.size);

    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
        backgroundColor: Colors.grey,
        
      ),
      body: Stack(
        children: [SingleChildScrollView(
          child: Padding( 
            padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GameTable(),
                  ),

                    table,
                    Piece(top1: true,
                    top2:true,
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
                      children: [Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                          onTapDown: (TapDownDetails details) { 
                            setState(() {
                              pointerOffset = details.localPosition;
                            });
                      
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
                          
                          feedback: 
                          Transform.translate(offset: Offset(-(5*cellSize.width)/2 + pointerOffset.dx, -(4*cellSize.height)/2 + pointerOffset.dy+cellSize.height/2),
                        
                            child: Plane(color: Colors.black, size: cellSize)
,
                          )
                          
                        //Plane(color: Colors.green, size: cellSize),
         
                        ),
                          ),
                          
                           GestureDetector(
                             onTapDown: (TapDownDetails details) { 
                            setState(() {
                              pointerOffset = details.localPosition;
                            });
                      
                          },
                             child: Draggable<int>(
                              child: Container(
                              child: Transform.rotate(
                              angle: 90 * pi/180,
                              child: Icon(Icons.flight, color: Colors.white),
                          ),
                                                    
                              width: 50,
                              height: 50,
                              color: Colors.green,
                          ),         
                          data: 1,
                          
                          feedback: 
                          
  
                              Transform.translate(offset: Offset(-(5*cellSize.width)/2 + pointerOffset.dx - cellSize.width/2,-(4*cellSize.height)/2 + pointerOffset.dy),
                              
                              child: Transform.rotate(angle: pi/2, 
                               child: Plane(color: Colors.black, size: cellSize)
,                             ),
                          )
                              

                          
                         
         
                        ),
                           ),
                         
                           GestureDetector(
                              onTapDown: (TapDownDetails details) { 
                            setState(() {
                              pointerOffset = details.localPosition;
                            });
                      
                          },
                             child: Draggable<int>(
                              
                              child: Container(
                                
                              child: Transform.rotate(
                              angle: 2*90 * pi/180,
                              child: Icon(Icons.flight, color: Colors.white),
                          ),
                                                    
                              width: 50,
                              height: 50,
                              color: Colors.green,
                          ),         
                          data: 2,
                          
                          feedback: 
                          
                          Transform.translate(offset: Offset(-(5*cellSize.width)/2 + pointerOffset.dx,-(4*cellSize.height)/2 + pointerOffset.dy-cellSize.height/2),
                              
                              child: Transform.rotate(angle: 2*pi/2, child: Plane(color: Colors.black, size: cellSize))
,
                          )
         
                        ),
                           ),
                           GestureDetector(
                              onTapDown: (TapDownDetails details) { 
                            setState(() {
                              pointerOffset = details.localPosition;
                            });
                      
                          },
                             child: Draggable<int>(
                              child: Container(
                              child: Transform.rotate(
                              angle: 3*90 * pi/180,
                              child: Icon(Icons.flight, color: Colors.white),
                          ),
                                                    
                              width: 50,
                              height: 50,
                              color: Colors.green,
                          ),         
                          data: 3,
                          
                          feedback: 
                          Transform.translate(offset: Offset(-(5*cellSize.width)/2 + pointerOffset.dx+cellSize.width/2,-(4*cellSize.height)/2 + pointerOffset.dy),
                              
                              child: Transform.rotate(angle: 3*pi/2, child: Plane(color: Colors.black, size: cellSize))
,
                          )
         
                        ),
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
          Plane(color: Colors.green, size: cellSize,)
          /*FloatingActionButton(
      
          
          child: Icon(Icons.airplanemode_active),
        
        backgroundColor: Colors.grey,
        onPressed: (){},
      ),*/
        ),
        backgroundColor: Colors.grey,
        onPressed: (){},
      ),
      
    );
  }
}
