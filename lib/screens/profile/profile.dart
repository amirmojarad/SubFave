import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/controllers/upload.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/left_side_menu.dart';
import 'package:subfave/screens/common/textfield.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final TextEditingController email = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Column(children: [
              SubfaveAppBar(
                scaffoldKey: _key,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LeftSideMenu(),
                  SizedBox(
                    width: width - 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          'https://unsplash.com/photos/rDEOVtE7vOs/download?force=true&w=1920',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color:
                                              Colors.black12.withOpacity(0.1),
                                        ),
                                      )
                                    ],
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    child: InkWell(
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        Upload upload = Upload();
                                        upload.uploadImage();
                                      },
                                      child: Icon(
                                        FeatherIcons.edit2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SubfaveTextField(
                                hintText: "username",
                                title: "Username",
                                controller: username,
                                error: false,
                                errorText: "Error Text",
                                isPassword: false,
                                validator: (value) {},
                                passwordIsValid: false,
                                passwordValidationText: "",
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SubfaveTextField(
                                hintText: "email",
                                title: "Email",
                                controller: email,
                                error: false,
                                errorText: "Error Text",
                                isPassword: false,
                                validator: (value) {},
                                passwordIsValid: false,
                                passwordValidationText: "",
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SubfaveTextField(
                                hintText: "",
                                title: "Password",
                                controller: username,
                                error: false,
                                errorText: "Error Text",
                                isPassword: true,
                                validator: (value) {},
                                passwordIsValid: false,
                                passwordValidationText: "",
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              SubfaveButton(title: "Edit", onTap: () {})
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
