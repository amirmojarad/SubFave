import 'package:flutter/material.dart';

class SubfaveButton extends StatelessWidget {
  const SubfaveButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => onTap(),
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 150,
        height: 75,
      ),
    );
  }
}
