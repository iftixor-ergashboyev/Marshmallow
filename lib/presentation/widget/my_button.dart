import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, required this.icon,required this.onClick});

  final String title;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple,
        borderRadius: BorderRadius.circular(20),
        onTap: onClick,
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  colors: [
                    CupertinoColors.activeBlue,
                    Colors.deepPurple,
                    Colors.teal
                  ]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,style: GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 20
              ),),
              const Gap(12),
              Icon(icon,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}