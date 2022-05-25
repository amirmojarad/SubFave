import 'package:flutter/material.dart';

class SubfaveEmailFormField extends StatelessWidget {
  SubfaveEmailFormField({
    Key? key,
    required this.controller,
    required this.error,
    required this.errorText,
    required this.validator,
  }) : super(key: key);
  final String errorText;
  final bool error;
  Function(String value) validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Email", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        SizedBox(
          child: TextFormField(
            validator: (value) => validator(value!),
            controller: controller,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              errorText: error ? errorText : null,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              hintText: "example@example.com",
              hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
