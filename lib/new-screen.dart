import 'package:flutter/material.dart';
import 'package:switcher_login/widgets/card.dart';
import 'package:switcher_login/widgets/customtextfield.dart';

class NewWidget extends StatefulWidget {
  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CardWidget(
        buttonName: "SIGN UP",
        widgets: <Widget>[
          CustomTextField(
            hintText: "Name",
            icon: Icons.email,
          ),
          Divider(),
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
          Divider(),
          CustomTextField(
            hintText: "Confirmation",
            icon: Icons.lock,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
