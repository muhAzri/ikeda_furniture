import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 246.w,
      height: 46.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/search.png',
            width: 16.w,
            height: 16.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration.collapsed(
                hintStyle: secondaryTextStyle,
                hintText: 'Search the best furniture',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
