import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/core/constance.dart';

class TextWidget extends StatelessWidget {
  const TextWidget.textWidget({

    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight,
    this.color = kPrimaryColor,

  });

  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color ;


  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}