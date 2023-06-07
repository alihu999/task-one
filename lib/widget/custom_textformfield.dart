import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String lable;
  final Icon icondata;
  final bool? ispassword;
  final void Function(String?)? onSaved;

  const CustomTextFormField(
      {super.key,
      required this.lable,
      required this.icondata,
      this.ispassword,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispassword == null ? false : true,
      validator: (val) {
        if (val!.length < 3 || val.isEmpty) {
          return " cannot be less than 3 characters";
        }
        if (val.length > 10) {
          return " cannot be mor than 10 characters";
        }
        return null;
      },
      onChanged: onSaved,
      decoration: InputDecoration(
          label: Text(lable),
          hintText: "Enter your $lable",
          suffixIcon: icondata,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.blue,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              ))),
    );
  }
}
