import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final bool isPassword;
  final String hintText;

  const CustomTextField({
    Key key,
    this.icon = Icons.email,
    this.isPassword = false,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
          size: 30,
        ),
        contentPadding: EdgeInsets.all(14),
        suffixIcon: !widget.isPassword
            ? null
            : IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isVisible = true;
                  });
                },
              ),
      ),
    );
  }
}
