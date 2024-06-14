import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  SignInButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        )),
        width: double.infinity,
        height: 55,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[400],
        ),
      ),
    );
  }
}
