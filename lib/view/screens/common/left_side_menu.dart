import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/view/providers/left_side_menu.dart';
import 'package:subfave/view/screens/common/left_side_bar_button.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({Key? key}) : super(key: key);
  final double heightBetweenItems = 16;
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
              isSelected: 0 == context.read<LeftSideMenuProvider>().isSelected,
              icon: FeatherIcons.home,
              title: "Home",
              onTap: () {
                context.read<LeftSideMenuProvider>().chageSelectedValue(0);
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(height: heightBetweenItems),
            LeftSideBarButton(
              onTap: () {
                context.read<LeftSideMenuProvider>().chageSelectedValue(1);
                Navigator.pushNamed(context, '/search');
              },
              isSelected: 1 == context.read<LeftSideMenuProvider>().isSelected,
              icon: FeatherIcons.search,
              title: "Search",
            ),
            SizedBox(height: heightBetweenItems),
            LeftSideBarButton(
              onTap: () {
                context.read<LeftSideMenuProvider>().chageSelectedValue(2);
                Navigator.pushNamed(context, '/files');
              },
              isSelected: 2 == context.read<LeftSideMenuProvider>().isSelected,
              icon: FeatherIcons.file,
              title: "Subtitles",
            ),
            SizedBox(height: heightBetweenItems),
            LeftSideBarButton(
              onTap: () {
                context.read<LeftSideMenuProvider>().chageSelectedValue(3);

                Navigator.pushNamed(context, '/collection');
              },
              isSelected: 3 == context.read<LeftSideMenuProvider>().isSelected,
              icon: FeatherIcons.grid,
              title: "Collections",
            ),
            SizedBox(height: heightBetweenItems),
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
