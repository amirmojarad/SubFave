
import 'package:flutter/material.dart';
import 'package:subfave/view/screens/config.dart';

class SubfaveThemeButton extends StatelessWidget {
  const SubfaveThemeButton({
    Key? key,
    required this.isActive,
    required this.color,
    required this.title,
  }) : super(key: key);
  final bool isActive;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title.toLowerCase().contains("light")) {
          currentTheme.changeTheme(false);
        } else {
          currentTheme.changeTheme(true);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? color : color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        width: 90,
        height: 50,
      ),
    );
  }
}
