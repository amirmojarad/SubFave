import 'package:flutter/material.dart';

class SubfaveLogoutButton extends StatelessWidget {
  const SubfaveLogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.4),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: SizedBox(
            width: 200,
            height: 75,
            child: Center(
              child: Text(
                "Logout",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
