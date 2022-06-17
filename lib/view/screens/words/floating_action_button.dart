import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/view/screens/words/showMenuAddButton.dart';

FloatingActionButton getWordsPageFloatingActionButton(BuildContext context, double width) {
  return FloatingActionButton(
    onPressed: () {
      showMenuAddButton(context, width);
    },
    backgroundColor: Theme.of(context).colorScheme.primary,
    child: Icon(
      FeatherIcons.plus,
      color: Theme.of(context).colorScheme.background,
    ),
  );
}
