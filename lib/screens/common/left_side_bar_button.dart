import 'package:flutter/material.dart';

class LeftSideBarButton extends StatelessWidget {
  const LeftSideBarButton({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onTap(),
        focusColor: Colors.transparent,
        hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 20,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
