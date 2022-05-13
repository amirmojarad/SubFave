
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/login.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context
                  .read<LoginProvider>()
                  .tapOnRememberMe(),
              child: Container(
                width: 15,
                height: 15,
                decoration:
                    context.watch<LoginProvider>().rememberMe
                        ? BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary,
                          )
                        : BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Remember me",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        SizedBox(width: 150,),
        Text("Forgot Password?")
      ],
    );
  }
}
