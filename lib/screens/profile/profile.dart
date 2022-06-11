import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/profile.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/button.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/left_side_menu.dart';
import 'package:subfave/screens/common/textfield.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final TextEditingController firstName = TextEditingController(),
      lastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(user.imageUrl);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      drawer: const SubfaveDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder(
          future: user.loadUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String firstNameHint = "", lastNameHint = "";
              if (user.fullName.isNotEmpty) {
                firstNameHint = user.fullName.split(" ")[0];
                lastNameHint = user.fullName.split(" ")[1];
              }
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 32),
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
                                  const Spacer(),
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
                                                  user.imageUrl == ""
                                                      ? "https://unsplash.com/photos/DCqAn1JtmQg/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjU0NDk2OTAz&force=true&w=1920"
                                                      : user.imageUrl,
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
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.black12
                                                      .withOpacity(0.1),
                                                ),
                                              )
                                            ],
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: InkWell(
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              onTap: () async {
                                                await context
                                                    .read<ProfileProvider>()
                                                    .uploadImage();
                                              },
                                              child: Icon(
                                                FeatherIcons.edit2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SubfaveTextField(
                                        hintText: firstNameHint,
                                        title: "First Name",
                                        controller: firstName,
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
                                        hintText: lastNameHint,
                                        title: "Last Name",
                                        controller: lastName,
                                        error: false,
                                        errorText: "Error Text",
                                        isPassword: false,
                                        validator: (value) {},
                                        passwordIsValid: false,
                                        passwordValidationText: "",
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      SubfaveButton(
                                        title: "Edit",
                                        onTap: () async {
                                          await user.loadUser();
                                          var headers = {
                                            'Authorization':
                                                'Bearer ${user.token}',
                                            'Content-Type': 'application/json'
                                          };
                                          var request = http.Request(
                                              'POST',
                                              Uri.parse(
                                                  'http://localhost:8080/users/'));
                                          request.body = json.encode({
                                            "id": user.id,
                                            "full_name": firstName.text +
                                                " " +
                                                lastName.text
                                          });
                                          request.headers.addAll(headers);

                                          http.StreamedResponse response =
                                              await request.send();

                                          if (response.statusCode == 200) {
                                            String token = user.token;
                                            String bytesToString =
                                                await response.stream
                                                    .bytesToString();
                                            print(bytesToString);
                                            user = User.fromJson(
                                              {
                                                "token": token,
                                                "user":
                                                    jsonDecode(bytesToString),
                                              },
                                            );
                                            user.save("user", user.toJson());
                                          } else {
                                            print(response.reasonPhrase);
                                          }
                                        },
                                      )
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
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Container(
              child: Text(
                  snapshot.error.toString() + " " + snapshot.data.toString()),
            );
          }),
    );
  }
}
