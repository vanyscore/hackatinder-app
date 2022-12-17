import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String name;
  final TextStyle? textStyle;

  const Tag({
    super.key,
    required this.name,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name,
        style: textStyle,
      ),
    );
  }
}
