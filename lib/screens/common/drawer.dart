import 'package:flutter/material.dart';
import 'package:subfave/screens/common/logout_button.dart';
import 'package:subfave/screens/common/subfave_card.dart';
import 'package:subfave/screens/common/theme_button.dart';
import 'package:subfave/screens/config.dart';

class SubfaveDrawer extends StatelessWidget {
  const SubfaveDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            const SubfaveCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubfaveThemeButton(
                    color: Color(0xffB7CBB7),
                    isActive: currentTheme.isDark,
                    title: "Light",
                  ),
                  SubfaveThemeButton(
                    color: Color(0xff364536),
                    isActive: currentTheme.isDark,
                    title: "Dark",
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: SubfaveLogoutButton(),
            )
          ],
        ),
      ),
    );
  }
}
