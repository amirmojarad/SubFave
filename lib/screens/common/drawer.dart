import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/screens/common/logout_button.dart';
import 'package:subfave/screens/config.dart';

class SubfaveDrawer extends StatelessWidget {
  const SubfaveDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Theme",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    child: Divider(),
                    width: width - 280,
                  ),
                  SizedBox(
                    width: width - 280,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ChangeThemeButton(light: true),
                          ChangeThemeButton(light: false)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // Spacer(),
              // SubfaveLogoutButton()
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    Key? key,
    required this.light,
  }) : super(key: key);
  final bool light;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(32),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            if (light) {
              currentTheme.changeTheme(false);
            } else {
              currentTheme.changeTheme(true);
            }
          },
          child: Icon(
            light ? FeatherIcons.sun : FeatherIcons.moon,
            size: 35,
            color: light
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: light
              ? Colors.transparent
              : Theme.of(context).colorScheme.primary,
        ),
        color: light
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
