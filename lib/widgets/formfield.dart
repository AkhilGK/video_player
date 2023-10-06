// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormfield extends StatefulWidget {
  CustomFormfield(
      {super.key,
      required this.controller,
      this.hintText,
      this.label,
      this.obscureText = false,
      this.isPassword = false,
      this.length = 25});
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  bool obscureText;
  bool isPassword;
  int length;

  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield>
    with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (email) {
          if (widget.isPassword) {
            if (isPasswordValid(email!)) {
              return null;
            } else {
              return 'Password must contain an Uppercase and lowercase letter,\n a special character and a number';
            }
          } else {
            if (isEmailValid(email!)) {
              return null;
            } else {
              return 'Enter a valid email address';
            }
          }
        },
        controller: widget.controller,
        obscureText: widget.obscureText,
        maxLength: widget.length,
        decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: widget.hintText,
            labelText: widget.label,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                  )
                : const SizedBox()),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) {
    if (password.length < 10) return false;

    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasSpecialChar = false;
    bool hasNumber = false;

    for (var char in password.runes) {
      var charAsString = String.fromCharCode(char);
      if (RegExp(r'[A-Z]').hasMatch(charAsString)) {
        hasUppercase = true;
      } else if (RegExp(r'[a-z]').hasMatch(charAsString)) {
        hasLowercase = true;
      } else if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(charAsString)) {
        hasSpecialChar = true;
      } else if (RegExp(r'[0-9]').hasMatch(charAsString)) {
        hasNumber = true;
      }
    }

    return hasUppercase && hasLowercase && hasSpecialChar && hasNumber;
  }

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
