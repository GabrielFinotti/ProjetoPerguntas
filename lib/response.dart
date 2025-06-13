import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const Response(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
