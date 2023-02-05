import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikeda_furniture/model/product_model.dart';
import 'package:ikeda_furniture/shared/theme.dart';
import 'package:ikeda_furniture/view/pages/detail_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;

  const ProductCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product: model),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 20.w,
        ),
        width: 200.w,
        height: 250.h,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            _buildImage(),
            _buildProductInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
      child: Image.asset(
        model.imageUrl,
        width: 200.w,
        height: 170.h,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.only(
        left: 10.w,
        right: 17.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductTitle(),
          _buildProductPriceWishlistRow(),
        ],
      ),
    );
  }

  Widget _buildProductTitle() {
    return Text(
      model.title,
      style: primaryTextStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: semiBold,
      ),
    );
  }

  Widget _buildProductPriceWishlistRow() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProductPrice(),
          _buildWishlistButton(),
        ],
      ),
    );
  }

  Widget _buildProductPrice() {
    return Text(
      'RP ${model.price}',
      style: priceTextStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: semiBold,
      ),
    );
  }

  Widget _buildWishlistButton() {
    return Container(
      width: 30.w,
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffD0D0D0),
          ),
          borderRadius: BorderRadius.circular(5.r)),
      child: Image.asset(
        'assets/icons/favorite.png',
        width: 20.w,
        height: 16.h,
      ),
    );
  }
}
