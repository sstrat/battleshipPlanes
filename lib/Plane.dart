// ignore: file_names
import 'package:flutter/material.dart';
import 'Piece.dart';


class Plane extends StatefulWidget {

  final Color color;
  final Size size;
  List<Piece> plane = [];


  Plane({
      Key? key,
      this.color = Colors.transparent,
      this.size = Size.zero,
   }) : super(key: key){

    plane = [
    /*0*/ Piece(color: this.color, top1: true, top2: true, planeSize: size),
    /*1*/ Piece(color: this.color, top1: true, planeSize: size),
    /*2*/ Piece(color: this.color, planeSize: size),
    /*3*/ Piece(color: this.color, planeSize: size),
    /*4*/ Piece(color: this.color, planeSize: size),
    /*5*/ Piece(color: this.color, top2: true, planeSize: size),
    /*6*/ Piece(color: this.color, planeSize: size),
    /*7*/ Piece(color: this.color, top1: true, planeSize: size),
    /*8*/ Piece(color: this.color, planeSize: size),
    /*9*/ Piece(color: this.color, top2: true, planeSize: size),
    ];
   }
   void initPlanes(Color col){
    
    plane = [
    /*0*/ Piece(color: this.color, top1: true, top2: true),
    /*1*/ Piece(color: this.color, top1: true, bot1: true),
    /*2*/ Piece(color: this.color),
    /*3*/ Piece(color: this.color),
    /*4*/ Piece(color: this.color),
    /*5*/ Piece(color: this.color, top2: true, bot2: true),
    /*6*/ Piece(color: this.color),
    /*7*/ Piece(color: this.color, top1: true, bot1: true),
    /*8*/ Piece(color: this.color),
    /*9*/ Piece(color: this.color, top2: true, bot2: true),
    ];
  }
  List<Piece> getPlane(){
    return plane;
  }


  
  //Piece(bool top1, bool top2, bool bot1, bool bot2, Color color);


  @override
  _MyPlaneState createState() => _MyPlaneState();
}

class _MyPlaneState extends State<Plane> {
  

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children:[
        Row(
          children: [
            this.widget.plane[0],
          ],
        ),
        Row(
          children: [
            this.widget.plane[1],
            this.widget.plane[2],
            this.widget.plane[3],
            this.widget.plane[4],
            this.widget.plane[5],
          ],
        ),
        Row(
          children: [
            this.widget.plane[6],
          ],
        ),
        Row(
          children: [
            this.widget.plane[7],
            this.widget.plane[8],
            this.widget.plane[9],
          ],
        ),
        
      ]
    );
   
  }
}
