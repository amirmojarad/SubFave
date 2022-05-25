import 'package:flutter/material.dart';

class SubfaveButton extends StatelessWidget {
  const SubfaveButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () async => onTap(),
          borderRadius: BorderRadius.circular(8),
          hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.primary, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 150,
      height: 75,
    );
  }
}
