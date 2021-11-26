import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({Key? key, this.title = "Test"}) : super(key: key);
 final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Color> manyColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.brown,
      Colors.purple,
      Colors.orange,
      Colors.pink
    ];
    bool isTapped = false;
    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];
    int z = 0;
    for (int i = 0; i <= 9; i++) {
      int maxColNr = 10;
      for (int y = 0; y <= maxColNr; y++) {
        int currentNumber = z + y; // 0,1,2,3,4,5,6,7,8,9,10, 10,11, 12, 13,14
        columnNumbers.add(currentNumber);
      }
      z += maxColNr;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }
    print(numbers);

    myRowChildren = numbers
        .map(
          (columns) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: columns.map((nr) {
              /*
              int min = 0;
              int max = manyColors.length;
              Random rnd = new Random();
              int randomNumber = min + rnd.nextInt(max - min);*/
              return InkWell(
                onTap: (){
                  setState(() {
                    isTapped = !isTapped;
                  });

                },
              child: Container(
                padding: EdgeInsets.all(10),
                color: isTapped ?Colors.pink : null,
                child: Text(
                  nr.toString(),
                ),
              ),
              );
            }).toList(),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: myRowChildren,
      ),
    );
  }
}