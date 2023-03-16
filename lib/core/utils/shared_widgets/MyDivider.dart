import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final double? width;
  final double? height;

  const MyDivider({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        height: height,
        width: width,
        color: Colors.grey[500],
      ),
    );
  }
}
