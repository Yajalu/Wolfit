import 'package:flutter/material.dart';

class NutricionWidget extends StatelessWidget {
  const NutricionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Icon(Icons.flatware, size: 35.0),
        Text("Nutrición", style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}