import 'package:flutter/material.dart';
import 'package:taskapp/presentation/widget/text_widegt.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key, required this.appbarTile});

  final String appbarTile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      title: TextWidget.textWidget(
        text: appbarTile,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
