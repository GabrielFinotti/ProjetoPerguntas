import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const Response(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          textStyle: TextStyle(color: Colors.white),
        ),
        child: Text(text),
      ),
    );
  }
}
