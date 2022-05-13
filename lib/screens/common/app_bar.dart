import 'package:flutter/material.dart';
import 'package:subfave/screens/config.dart';

class SubfaveAppBar extends StatelessWidget {
  const SubfaveAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 400,
          height: 100,
          child: Column(
            children: const [
              Text("Subfave."),
              Text("Learn through movie subtitles")
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        GestureDetector(
          onTap: currentTheme.changeTheme,
          child: Container(
            child: Text(currentTheme.isDark ? "Light" : "Dark"),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
