import 'package:flutter/material.dart';
import 'package:taskapp/presentation/widget/divider_widget.dart';
import 'package:taskapp/presentation/widget/text_widget.dart';

import '../../core/constance.dart';
import '../../core/space.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key});
  final String checkList = "assets/icons/checklist.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(space),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .3),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Image.asset(checkList,height: 25, color: kBlueColor)),
                TextWidget.textWidget(
                  text: "Complete all task ",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space),
            child: DividerWidget(heighDivider: 1, thickness: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(space),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.textWidget(text: "Date Time :",fontWeight: FontWeight.w400),
                TextWidget.textWidget(text: "15 11 2025" , fontWeight: FontWeight.bold)
              ],
            ),
          )
        ],
      ),
    );
  }
}
