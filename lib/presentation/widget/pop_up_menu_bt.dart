// lib/presentation/widget/pop_up_menu_bt.dart

import 'package:flutter/material.dart';
import 'package:taskapp/presentation/widget/text_widget.dart';
import '../../core/constance.dart';

enum MenuItemValues { edit, delete }

// 1. Change to a StatelessWidget, as it no longer manages its own state.
class PopUpMenuBt extends StatelessWidget {
  // 2. Add properties to receive the functions (callbacks) from the parent.
  final VoidCallback onEditSelected;
  final VoidCallback onDeleteSelected;

  const PopUpMenuBt({
    super.key,
    // 3. Make them required in the constructor.
    required this.onEditSelected,
    required this.onDeleteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<MenuItemValues>(
        offset: const Offset(5, 5),
        iconSize: 25,
        splashRadius: 25,
        color: kBlueColor,
        shadowColor: kBlueColor,
        icon: Icon(Icons.more_vert, color: kBlueColor),
        padding: EdgeInsets.zero,
        itemBuilder: (context) => <PopupMenuEntry<MenuItemValues>>[
          PopupMenuItem(
            height: 20,
            value: MenuItemValues.edit,
            child: Center(
                child: TextWidget.textWidget(text: "Edit", color: kWhiteColor)
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            height: 20,
            value: MenuItemValues.delete,
            child: Center(
                child: TextWidget.textWidget(
                    text: "Delete", color: kWhiteColor)),
          ),
        ],
      ),
    );
  }
}
