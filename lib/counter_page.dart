// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Color buttonColor;
  Counter({super.key, required this.buttonColor});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void increment() {
    // Verifies the mounted variable before perform a setState prevents runtime errors
    if(mounted) {
      setState(() {
        counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increment();
        },
        backgroundColor: widget.buttonColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
