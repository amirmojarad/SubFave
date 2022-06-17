
import 'package:flutter/material.dart';

class SubfaveSectionHeader extends StatelessWidget {
  const SubfaveSectionHeader(
      {Key? key, required this.width, required this.list, required this.title})
      : super(key: key);
  final String title;
  final List<Widget> list;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
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
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return list[index];
              },
            ),
          ),
        )
      ],
    );
  }
}
