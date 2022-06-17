import 'package:flutter/material.dart';

class SubfaveCard extends StatelessWidget {
  const SubfaveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 90,
      child: Center(
        child: Text(
          "SubFave",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 40, color: Theme.of(context).colorScheme.background),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
