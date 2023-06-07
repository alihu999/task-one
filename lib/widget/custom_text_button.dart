import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String textrow;
  final String lable;

  const CustomTextButton(
      {super.key, required this.textrow, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textrow,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            lable,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
