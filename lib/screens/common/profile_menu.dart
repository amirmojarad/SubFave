import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/screens/config.dart';

showProfileMenu(BuildContext context, double width) {
  return showMenu(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    context: context,
    position: RelativeRect.fromLTRB(width - 50, 100, 40, 1000),
    items: [
      PopupMenuItem(
        child: GestureDetector(
          onTap: () async {
            Navigator.pushNamed(context, '/profile');
          },
          child: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, '/profile');
          },
          child: Text(
            "Change Password",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
      PopupMenuItem(
          child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Text(
          "Logout",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      )),
    ],
  );
}
