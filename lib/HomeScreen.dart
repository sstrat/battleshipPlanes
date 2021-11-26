import 'package:flutter/material.dart';
import 'Game.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameRoute()),
            );
          },
        ),
      ),
    );
  }
}