import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({Key? key, required this.isLeft, required this.onTap})
      : super(key: key);
  final Function onTap;
  final bool isLeft;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: isLeft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
          onTap: onTap(),
          child: Icon(
              isLeft ? FeatherIcons.chevronLeft : FeatherIcons.chevronRight,
              color: Theme.of(context).colorScheme.background),
        ),
      ),
      width: 50,
      height: 50,
    );
  }
}
