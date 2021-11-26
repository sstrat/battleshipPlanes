import 'package:flutter/material.dart';



class MyContainer extends StatefulWidget {
  Color mycolor = Colors.white;
  MyContainer({Key? key, color, isPresed}) : super(key: key){
    this.mycolor = color;
  }

  
  
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Text(""),
      color: widget.mycolor,
    );
  }
}