import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const PasswordTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;
  bool? _isPassValid;

  @override
  Widget build(BuildContext context) {
    Color displayColor = _isPassValid == null
        ? ColorPallete.defaultInputBorderColor
        : _isPassValid!
            ? Colors.green
            : Colors.red;
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          _isPassValid = (value.length < 6) ? false : true;
        });
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: displayColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: displayColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: displayColor),
            borderRadius: BorderRadius.circular(10)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _isPassValid == null
                    ? const Text(' ')
                    : _isPassValid!
                        ? const Text(
                            "\u{1F604}",
                            style: TextStyle(fontSize: 20),
                          )
                        : const Text(
                            "\u{1F620}",
                            style: TextStyle(fontSize: 20),
                          ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
