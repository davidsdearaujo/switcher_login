import 'package:flutter/material.dart';
import 'package:switcher_login/widgets/card.dart';
import 'package:switcher_login/widgets/customtextfield.dart';

class ExistingScreen extends StatefulWidget {
  @override
  _ExistingScreenState createState() => _ExistingScreenState();
}

class _ExistingScreenState extends State<ExistingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CardWidget(
          buttonName: "LOGIN",
          widgets: <Widget>[
            CustomTextField(
              hintText: "Email Address",
              icon: Icons.email,
            ),
            Divider(),
            CustomTextField(
              hintText: "Password",
              icon: Icons.lock,
              isPassword: true,
            ),
          ],
        ),
      ],
    );
  }
}
