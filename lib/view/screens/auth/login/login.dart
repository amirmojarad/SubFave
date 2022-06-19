import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/login.dart';
import 'package:subfave/view/screens/auth/login/remember_me.dart';
import 'package:subfave/view/screens/common/button.dart';
import 'package:subfave/view/screens/common/email_form.dart';
import 'package:subfave/view/screens/common/password_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loading = context.watch<LoginProvider>().isLoading;
    return Scaffold(
      // key: _key,
      // drawer: const SubfaveDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 16),
                        child: Row(
                          children: [
                            Text(
                              "Subfave",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
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
                          const SizedBox(
                            height: 16,
                          ),
                          SubfavePasswordFormField(
                            title: "Password",
                            controller: passwordController,
                            error: false,
                          ),
                          const SizedBox(height: 16),
                          const RememberMe(),
                          const SizedBox(height: 128),
                          SubfaveButton(
                              title: "Login",
                              onTap: () async {
                                bool isLoggedIn =
                                    await context.read<LoginProvider>().login(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                if (isLoggedIn) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                } else {}
                              }),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New To Subfave?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const SizedBox(
                                width: 6,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/'),
                                  child: Text(
                                    "Sign Up",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
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
