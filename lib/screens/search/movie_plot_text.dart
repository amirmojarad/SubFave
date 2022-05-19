
import 'package:flutter/material.dart';

class MoviePlotText extends StatelessWidget {
  const MoviePlotText({
    Key? key,
    required this.plot,
  }) : super(key: key);

  final String plot;

  @override
  Widget build(BuildContext context) {
    return Text(plot);
  }
}