import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class EmailTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const EmailTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailTextFormFieldState createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  bool? _isEmailValid;

  @override
  Widget build(BuildContext context) {
    Color displayColor = _isEmailValid == null
        ? ColorPallete.defaultInputBorderColor
        : _isEmailValid!
            ? Colors.green
            : Colors.red;
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          _isEmailValid = EmailValidator.validate(value);
        });
      },
      decoration: InputDecoration(
        labelText: "Email*",
        labelStyle: TextStyle(color: displayColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: displayColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: displayColor),
            borderRadius: BorderRadius.circular(10)),
        suffixIcon: _isEmailValid == null
            ? const Icon(Icons.email_rounded)
            : _isEmailValid!
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "\u{1F604}",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "\u{1F620}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
      ),
    );
  }
}
