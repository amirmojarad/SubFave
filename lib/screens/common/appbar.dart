import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/screens/common/profile_menu.dart';

class SubfaveAppBar extends StatelessWidget {
  const SubfaveAppBar({
    Key? key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
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
              child: Material(
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    showProfileMenu(context, width);
                  },
                  child: const Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: SizedBox(
            child: const Divider(),
            width: width,
            height: 0,
          ),
        )
      ],
    );
  }
}
