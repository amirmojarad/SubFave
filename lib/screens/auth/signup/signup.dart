import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/signup.dart';
import 'package:subfave/screens/common/app_bar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/textfield.dart';
import 'package:subfave/screens/config.dart';
import 'package:subfave/screens/subfave.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SubfaveAppBar(),
                const SizedBox(
                  height: 64,
                ),
                SubfaveTextField(
                  hintText: "example@example.com",
                  title: "Email",
                  controller: email,
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  controller: username,
                  hintText: "",
                  title: "Username",
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  controller: password,
                  hintText: "",
                  title: "Password",
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  controller: confirmPassword,
                  hintText: "",
                  title: "Confirm Password",
                ),
                const SizedBox(height: 32),
                SubfaveButton(
                  title: "SignUp",
                  onTap: () async => context.read<SignupProvider>().signup(
                        username.text,
                        password.text,
                        confirmPassword.text,
                        email.text,
                      ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an Account?",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.9),
                              ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
