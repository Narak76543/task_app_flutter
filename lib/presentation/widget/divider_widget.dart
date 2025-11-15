import 'package:flutter/material.dart';

import '../../core/constance.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, required this.heighDivider, required this.thickness});
  final double heighDivider ;
  final double thickness ;
  final Color dividerColor = kBlueColor ;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: heighDivider,
      thickness: thickness,
      color: dividerColor,
    );
  }
}
