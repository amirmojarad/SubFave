import 'package:flutter/material.dart';

class SubfaveTextField extends StatelessWidget {
  const SubfaveTextField({
    Key? key,
    required this.hintText,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        Container(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.primary)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          height: 50,
          width: 400,
        ),
      ],
    );
  }
}
