import 'package:flutter/material.dart';
import 'package:taskapp/core/constance.dart';
import 'package:taskapp/presentation/widget/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    required this.onPressed,
    required this.bdRadius,
    required this.text,
    this.width = 50,
  });

  final IconData? icon;

  final void Function() onPressed;
  final double bdRadius;
  final String? text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(bdRadius),
          color: kBlueColor,
        ),
        child: icon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
                color: kWhiteColor,
              )
            : Center(
                child: TextWidget.textWidget(
                  text: text ?? "",
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                  fontSize: 17,
                ),
              ),
      ),
    );
  }
}
