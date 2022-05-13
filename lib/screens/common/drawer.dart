import 'package:flutter/material.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/config.dart';

class SubfaveDrawer extends StatelessWidget {
  const SubfaveDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SubfaveButton(title: currentTheme.isDark ? "Dark" : "Light", onTap: currentTheme.changeTheme),
        ],
      ),
    );
  }
}
