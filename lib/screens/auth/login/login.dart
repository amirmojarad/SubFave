import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/login.dart';
import 'package:subfave/screens/auth/login/remember_me.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/email_form.dart';
import 'package:subfave/screens/common/password_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loading = context.watch<LoginProvider>().isLoading;
    return Scaffold(
      key: _key,
      drawer: const SubfaveDrawer(),
      appBar: getAppBar(_key),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
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
                                  // TODO Navigate to Main Menu Page
                                  Navigator.pushReplacementNamed(context,'/home');
                                } else {

                                }
                              }),
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
