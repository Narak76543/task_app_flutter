import 'package:flutter/material.dart';
import '../../core/constance.dart';
import '../../core/space.dart';

class TextBtnRd extends StatelessWidget {
  const TextBtnRd({
    super.key,
    required this.textButtonText,
    required this.forGColor,
    required this.backGColor,
  });


  final TextButton textButtonText;
  final Color forGColor;
  final Color backGColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backGColor,
        side: BorderSide(color: kGreyColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        foregroundColor: forGColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: textButtonText,
    );
  }
}
