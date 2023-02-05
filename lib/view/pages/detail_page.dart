import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/product_model.dart';
import '../../shared/theme.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;

  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconHeader(context),
              _buildCarousel(context),
              _buildProductInfo(),
              _buildDescription(),
              _buildAddCartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSettingsIcon(context),
          _buildChatIcon(),
        ],
      ),
    );
  }

  Widget _buildSettingsIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/icons/back.png',
        width: 22.w,
        height: 22.h,
      ),
    );
  }

  Widget _buildChatIcon() {
    return GestureDetector(
      child: Image.asset(
        'assets/icons/cart.png',
        width: 22.w,
        height: 22.h,
        color: primaryColor,
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    List<String> imageList(String imageUrl) {
      return List.filled(3, imageUrl);
    }

    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: CarouselSlider(
        items: imageList(widget.product.imageUrl)
            .map(
              (image) => _buildImage(
                image,
              ),
            )
            .toList(),
        options: CarouselOptions(
          initialPage: 0,
          enableInfiniteScroll: false,
          height: 375.h,
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      width: 300.w,
      height: 375.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      margin: EdgeInsets.only(
        top: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildProductName(),
              _buildQuantity(),
            ],
          ),
          _buildPrice(),
        ],
      ),
    );
  }

  Widget _buildProductName() {
    return Expanded(
      child: Text(
        widget.product.title,
        style: primaryTextStyle.copyWith(
          fontSize: 22.sp,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget _buildQuantity() {
    return Row(
      children: [
        _buildSubstractButton(),
        _buildQuantityText(),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildSubstractButton() {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            if (quantity != 1) {
              quantity--;
            }
          },
        );
      },
      child: Container(
        width: 35.w,
        height: 35.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: secondaryTextColor,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.remove,
            color: secondaryTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityText() {
    return Text(
      quantity > 9 ? quantity.toString() : "0$quantity",
      style: primaryTextStyle.copyWith(
        fontSize: 20.sp,
        fontWeight: semiBold,
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            quantity++;
          },
        );
      },
      child: Container(
        width: 35.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: primaryColor,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      child: Text(
        'Rp ${widget.product.price}',
        style: priceTextStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.only(
        top: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDescriptionTitle(),
          _buildDescriptionText(),
        ],
      ),
    );
  }

  Widget _buildDescriptionTitle() {
    return Text(
      "Deskripsi",
      style: primaryTextStyle.copyWith(
        fontSize: 18.sp,
        fontWeight: semiBold,
      ),
    );
  }

  Widget _buildDescriptionText() {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
      ),
      child: Text(
        widget.product.description,
        style: secondaryTextStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: medium,
          color: const Color(0xffBFBFBF),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildAddCartButton() {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 66.w,
        vertical: 19.h,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          'Tambah ke Keranjang',
          style: whiteTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
