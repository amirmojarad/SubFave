import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/screens/common/left_side_bar_button.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftSideBarButton(
              isSelected: true,
              icon: FeatherIcons.home,
              title: "Home",
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            const SizedBox(height: 32),
            LeftSideBarButton(
              onTap: () => Navigator.pushNamed(context, '/search'),
              isSelected: false,
              icon: FeatherIcons.search,
              title: "Search",
            ),
            const SizedBox(height: 32),
            LeftSideBarButton(
              onTap: () {},
              isSelected: false,
              icon: FeatherIcons.grid,
              title: "College",
            ),
            SizedBox(height: 32),
            LeftSideBarButton(
              onTap: () {},
              isSelected: false,
              icon: FeatherIcons.film,
              title: "My Movies",
            ),
          ],
        ),
        SizedBox(
          child: VerticalDivider(),
          height: height,
        ),
      ],
    );
  }
}
