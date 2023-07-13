



import 'package:flutter/material.dart';

import '../../common/utils/common_colors.dart';

class GredientView extends StatelessWidget {

  final double? width;
  final double? height;
  const GredientView({Key? key,this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [brown0432821,brown5E2111],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
