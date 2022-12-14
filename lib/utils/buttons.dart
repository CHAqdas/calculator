import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final text;
  final textcolor;
  final color;
  final buttontapped;
  const Mybutton(
      {required this.text,
      required this.textcolor,
      required this.color,
      required this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
