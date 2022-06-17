import 'package:flutter/material.dart';

class SubfavePasswordFormField extends StatelessWidget {
  SubfavePasswordFormField({
    Key? key,
    required this.title,
    required this.controller,
    required this.error,
  }) : super(key: key);
  final String title;
  final bool error;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        SizedBox(
          child: TextFormField(
            style: Theme.of(context).textTheme.headlineSmall,
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              errorText: error ? "Passwords Are not Match" : null,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1.5, color: Theme.of(context).colorScheme.primary),
              ),
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
