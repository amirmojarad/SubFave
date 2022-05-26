import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SubfaveAppBar extends StatelessWidget {
  const SubfaveAppBar({
    Key? key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              focusColor: Colors.transparent,
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: const Icon(
                FeatherIcons.barChart2,
                size: 30,
              ),
            ),
          ),
        ),
        Container(
          child: Icon(
            Icons.person,
            size: 40,
          ),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
