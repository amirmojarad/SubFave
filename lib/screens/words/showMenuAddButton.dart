import 'package:flutter/material.dart';

Future showMenuAddButton(BuildContext context, double width) {
  return showMenu(
    context: context,
    position: RelativeRect.fromLTRB(width - 50, 460, 60, 100),
    items: [
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add To Favorites",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
      ),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add To Category",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
      ),
    ],
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );
}
