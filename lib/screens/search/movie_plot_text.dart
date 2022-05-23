import 'package:flutter/material.dart';

class MoviePlotText extends StatelessWidget {
  const MoviePlotText({
    Key? key,
    required this.plot,
  }) : super(key: key);

  final String plot;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        plot,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
      ),
    );
  }
}
