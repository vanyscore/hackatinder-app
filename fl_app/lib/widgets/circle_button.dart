import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final Widget icon;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
