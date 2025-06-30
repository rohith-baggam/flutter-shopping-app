import 'package:flutter/material.dart';

class BrandTitleWidget extends StatelessWidget {
  const BrandTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Shoes\nCollection",
        // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
