import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/presentation/widget/text_widget.dart';
import '../../core/constance.dart';
import '../../core/space.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kBlueColor, width: 2),
        borderRadius: BorderRadius.circular(radius),
      ),
      title: TextWidget.textWidget(
        text: "Add Category! ",
        fontSize: 21,
        color: kBlueColor,
        fontWeight: FontWeight.bold,
      ),
      content: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kGreyColor),
            borderRadius: BorderRadius.circular(radius),
          ),
          hintText: "enter category name",
          hintStyle: GoogleFonts.poppins(color: kGreyColor),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            side: BorderSide(color: kGreyColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            foregroundColor: kBlueColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget.textWidget(text: "Cancel"),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlueColor,
            side: BorderSide(color: kBlueColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            foregroundColor: kBlueColor,
          ),
          onPressed: () {},
          child: TextWidget.textWidget(text: "Add", color: kWhiteColor),
        ),
      ],
    );
    ;
  }
}
