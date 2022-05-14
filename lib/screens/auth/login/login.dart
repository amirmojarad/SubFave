import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/login.dart';
import 'package:subfave/controllers/signup.dart';
import 'package:subfave/screens/auth/login/remember_me.dart';
import 'package:subfave/screens/auth/signup/signup.dart';
import 'package:subfave/screens/common/app_bar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/email_form.dart';
import 'package:subfave/screens/common/password_form.dart';
import 'package:subfave/screens/common/textfield.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loading = context.watch<LoginProvider>().isLoading;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      const SubfaveAppBar(),
                      const SizedBox(
                        height: 64,
                      ),
                      Column(
                        children: [
                          SubfaveEmailFormField(
                            controller: emailController,
                            error: false,
                            errorText: "",
                            validator: (value) => {},
                          ),
                          SubfavePasswordFormField(
                            title: "Password",
                            controller: passwordController,
                            error: false,
                          )
                          // SubfaveTextField(
                          //   passwordIsValid: false,
                          //   passwordValidationText: "",
                          //   validator: (value) => {},
                          //   isPassword: false,
                          //   error: false,
                          //   errorText: "",
                          //   hintText: "example@example.com",
                          //   title: "Email",
                          //   controller: emailController,
                          // ),
                          // const SizedBox(height: 16),
                          // SubfaveTextField(
                          //   passwordIsValid: context
                          //       .watch<LoginProvider>()
                          //       .passwordValidation,
                          //   passwordValidationText: "Weak Password",
                          //   validator: (value) => {},
                          //   isPassword: true,
                          //   error: false,
                          //   errorText: "",
                          //   hintText: "",
                          //   title: "Password",
                          //   controller: passwordController,
                          // ),
                          ,
                          const SizedBox(height: 16),
                          const RememberMe(),
                          const SizedBox(height: 128),
                          SubfaveButton(
                            title: "Login",
                            onTap: () async =>
                                context.read<LoginProvider>().login(
                                      emailController.text,
                                      passwordController.text,
                                    ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New To Subfave?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
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
                                onTap: () => Navigator.pushNamed(context, '/'),
                                child: Text(
                                  "Sign Up",
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
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
