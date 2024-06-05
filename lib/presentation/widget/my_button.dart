import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, required this.onClick});

  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GlowButton(
      height: 40,
        width: 120,
        onPressed: onClick, color: Colors.red.shade300, child: Text(title));
  }
}

