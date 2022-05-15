
import 'package:flutter/material.dart';

class SubfaveCardItem extends StatelessWidget {
  const SubfaveCardItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 40, color: Theme.of(context).colorScheme.background),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-3, 8),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.9),
          ),
        ],
      ),
    );
  }
}
