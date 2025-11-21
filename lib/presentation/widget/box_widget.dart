// lib/presentation/widget/box_widget.dart

import 'package:flutter/material.dart';
import 'package:taskapp/presentation/widget/divider_widget.dart';
import 'package:taskapp/presentation/widget/pop_up_menu_bt.dart'; // Make sure this is imported
import 'package:taskapp/presentation/widget/text_widget.dart';
import 'package:taskapp/utils/helper.dart';
import '../../core/constance.dart';
import '../../core/space.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.text,
    required this.dateTime,
    // 1. Add callbacks for the actions
    required this.onEdit,
    required this.onDelete,
  });

  final String text;
  final String dateTime;
  final String checkList = "assets/icons/checklist.png";

  // 2. Define the callback types
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(space),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Use withOpacity for clarity
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
        color: kWhiteColor,
        border: Border(top: BorderSide(color: kBlueColor, width: 6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(checkList, height: 20, color: kBlueColor),
              ),
              TextWidget.textWidget(
                text: text,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              const Spacer(),

              // 3. Replace the old PopupMenuButton with your reusable one
              PopUpMenuBt(
                onEditSelected: onEdit, // Connect the callbacks
                onDeleteSelected: onDelete,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space),
            child: const DividerWidget(heighDivider: 1, thickness: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(space),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.textWidget(
                  text: "Date Time :",
                  fontWeight: FontWeight.w400,
                ),
                TextWidget.textWidget(
                  text: convertToDate(dateTime),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
