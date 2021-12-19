import 'package:flutter/material.dart';

class InformacionWidget extends StatelessWidget {
  const InformacionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Icon(Icons.assignment, size: 35.0),
        Text("Información", style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}