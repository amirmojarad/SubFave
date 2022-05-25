import 'package:flutter/material.dart';

class SubfaveCardItem extends StatelessWidget {
  const SubfaveCardItem({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(12),
          hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 40,
                  ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-3, 8),
            blurRadius: 1,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
