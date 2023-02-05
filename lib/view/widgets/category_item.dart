import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikeda_furniture/shared/theme.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoriesItem(
      {super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 16.5.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        title,
        style: isSelected
            ? whiteTextStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: medium,
              )
            : secondaryTextStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: medium,
              ),
      ),
    );
  }
}
