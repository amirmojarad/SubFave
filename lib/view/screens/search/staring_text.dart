
import 'package:flutter/material.dart';

class StaringText extends StatelessWidget {
  const StaringText({
    Key? key,
    required this.stars,
  }) : super(key: key);

  final String stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Staring:"), Text(stars)],
    );
  }
}