import 'package:flutter/material.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Icon(Icons.home, size: 40.0),
        Text("Plan", style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}