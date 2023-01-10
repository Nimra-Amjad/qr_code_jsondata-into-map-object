import 'package:flutter/material.dart';
import 'package:qr_code_scanner/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackButtonRounded extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final Color iconcolor;
  final Color bordercolor;

  const BackButtonRounded({
    Key? key,
    this.onTap,
    this.color = AppColors.primaryBlack,
    this.iconcolor = AppColors.primaryWhite,
    this.bordercolor = AppColors.primaryBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: bordercolor),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryBlack,
          ),
        ),
      ),
    );
  }
}
