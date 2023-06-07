import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const CustomButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        child: InkWell(
          splashColor: Colors.white,
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 50,
            width: 120,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
