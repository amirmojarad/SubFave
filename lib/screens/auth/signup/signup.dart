import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/signup.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/email_form.dart';
import 'package:subfave/screens/common/textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final TextEditingController email = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const SubfaveDrawer(),
      appBar: getAppBar(_key),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                SubfaveEmailFormField(
                  controller: email,
                  error: false,
                  errorText: "",
                  validator: (value) => {},
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  passwordIsValid: false,
                  passwordValidationText: "",
                  validator: (value) => {},
                  isPassword: false,
                  error: false,
                  errorText: "",
                  controller: username,
                  hintText: "",
                  title: "Username",
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  passwordIsValid:
                      context.watch<SignupProvider>().passwordValidation,
                  passwordValidationText: "Weak Password",
                  validator: (value) =>
                      context.read<SignupProvider>().checkConfirmPassword(
                            password.text,
                            confirmPassword.text,
                          ),
                  isPassword: true,
                  error: context.watch<SignupProvider>().passwordsAreNotEqual,
                  errorText: "Passwords Are Not Equal",
                  controller: password,
                  hintText: "",
                  title: "Password",
                ),
                const SizedBox(height: 16),
                SubfaveTextField(
                  passwordIsValid: false,
                  passwordValidationText: "",
                  validator: (value) =>
                      context.read<SignupProvider>().checkConfirmPassword(
                            password.text,
                            confirmPassword.text,
                          ),
                  isPassword: true,
                  error: context.watch<SignupProvider>().passwordsAreNotEqual,
                  errorText: "Passwords Are Not Equal",
                  controller: confirmPassword,
                  hintText: "",
                  title: "Confirm Password",
                ),
                const SizedBox(height: 32),
                SubfaveButton(
                  title: "SignUp",
                  onTap: () async {
                    bool result = await context.read<SignupProvider>().signup(
                          username.text,
                          password.text,
                          confirmPassword.text,
                          email.text,
                        );
                    if (result) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?",
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(
                      width: 6,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
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
          ),
        ),
      ),
    );
  }
}
