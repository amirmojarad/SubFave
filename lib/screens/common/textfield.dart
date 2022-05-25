import 'package:flutter/material.dart';

class SubfaveTextField extends StatelessWidget {
  SubfaveTextField({
    Key? key,
    required this.hintText,
    required this.title,
    required this.controller,
    required this.error,
    required this.errorText,
    required this.isPassword,
    required this.validator,
    required this.passwordIsValid,
    required this.passwordValidationText,
  }) : super(key: key);
  final String errorText;
  final String hintText;
  final String title;
  final String passwordValidationText;
  final bool passwordIsValid;
  final bool error;
  final bool isPassword;
  Function(String value) validator;
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
            validator: (value) => validator(value!),
            controller: controller,
            obscureText: isPassword,
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
              hintText: hintText,
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
