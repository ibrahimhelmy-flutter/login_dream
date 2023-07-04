import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final GestureTapCallback? onTap;
  final Size size;
  final Color? color;

  const SvgIcon(
      {super.key,
      this.size = const Size(40, 40),
      required this.assetPath,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width+5,
      height: size.height+5,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // behavior: HitTestBehavior.opaque,
            onTap: onTap,

            splashColor: AppColors.primaryColor.withOpacity(0.5),
            child: Center(
              child: SvgPicture.asset(
                assetPath,
                width: size.width,
                height: size.height,
                color: color,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget customIcon(
    BuildContext context, {
      required IconData icon,
      bool isEnable = false,
      double size = 18,
      bool isFontAwesomeSolid = false,
      Color? iconColor,
      double paddingIcon = 0,
    }) {
  iconColor = iconColor ?? Theme.of(context).textTheme.caption!.color;
  return Padding(
    padding: EdgeInsets.only(bottom:  paddingIcon),
    child: Icon(
      icon,
      size: size,
      color: isEnable ? Theme.of(context).primaryColor : iconColor,
    ),
  );
}