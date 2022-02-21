// ignore: file_names
import 'package:flutter/material.dart';

class Piece extends StatefulWidget {
  final bool top1;
  final bool top2;
  final bool bot1;
  final bool bot2;

  final bool eTop;
  final bool eLeft;
  final bool eRight;
  final bool eDown;

  Icon icon = Icon(null);

  Color color;
  Size size = Size.zero;
  final Size planeSize;
  Piece({
    Key? key,
    this.top1 = false,
    this.top2 = false,
    this.bot1 = false,
    this.bot2 = false,
    this.eTop = false,
    this.eLeft = false,
    this.eDown = false,
    this.eRight = false,
    this.color = Colors.transparent,
    this.icon = const Icon(null),
    this.planeSize = Size.zero,
  }) : super(key: key);

  //Piece(bool top1, bool top2, bool bot1, bool bot2, Color color);

  void setIcon(Icon icon) {
    this.icon = icon;
  }

  @override
  _MyPieceState createState() => _MyPieceState();
}

class _MyPieceState extends State<Piece> {
  @override
  Widget build(BuildContext context) {
    return // Padding(
        //padding: EdgeInsets.only(left: ),
        /*child:*/ Container(
      width: this.widget.planeSize.width,
      height: this.widget.planeSize.height,
      //color: this.widget.color,
      child: this.widget.icon,
      decoration: BoxDecoration(
          color: this.widget.color,
          borderRadius: BorderRadius.only(
            topLeft:
                this.widget.top1 ? Radius.circular(30) : Radius.circular(1),
            topRight:
                this.widget.top2 ? Radius.circular(30) : Radius.circular(1),
            bottomLeft:
                this.widget.bot1 ? Radius.circular(30) : Radius.circular(1),
            bottomRight:
                this.widget.bot2 ? Radius.circular(30) : Radius.circular(1),
          )),
//    )
    );
  }
}
