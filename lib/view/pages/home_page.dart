import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikeda_furniture/model/product_model.dart';
import 'package:ikeda_furniture/shared/theme.dart';
import 'package:ikeda_furniture/view/widgets/category_item.dart';
import 'package:ikeda_furniture/view/widgets/forms.dart';
import 'package:ikeda_furniture/view/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<ProductModel> productList = [
    ProductModel(
      title: 'Kursi Ruangan',
      imageUrl: 'assets/images/furniture1.png',
      price: '129.000',
      description:
          'Kursi ini adalah kursi ajaib bisa membuat anda menjadi produktif setiap hari yang membuat anda cepat kaya tentunya dan akan membuat tetangga heran.',
    ),
    ProductModel(
      title: 'Kursi Kantor',
      imageUrl: 'assets/images/furniture2.png',
      price: '89.000',
      description:
          'Kursi ini adalah kursi ajaib bisa membuat anda menjadi produktif setiap hari yang membuat anda cepat kaya tentunya dan akan membuat tetangga heran.',
    ),
    ProductModel(
      title: 'Kursi Santai',
      imageUrl: 'assets/images/furniture3.png',
      price: '140.000',
      description:
          'Kursi ini adalah kursi ajaib bisa membuat anda menjadi produktif setiap hari yang membuat anda cepat kaya tentunya dan akan membuat tetangga heran.',
    ),
    ProductModel(
      title: 'Kursi Makan',
      imageUrl: 'assets/images/furniture4.png',
      price: '200.000',
      description:
          'Kursi ini adalah kursi ajaib bisa membuat anda menjadi produktif setiap hari yang membuat anda cepat kaya tentunya dan akan membuat tetangga heran.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        children: [
          _buildIconHeader(),
          _buildHeaderText(),
          _buildSearchRow(),
          _buildCategoreis(),
          _buildProductByCategories(),
          _buildPopularProduct(),
        ],
      ),
    );
  }

  Widget _buildIconHeader() {
    return Container(
      margin: EdgeInsets.only(top: 34.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSettingsIcon(),
          _buildChatIcon(),
        ],
      ),
    );
  }

  Widget _buildSettingsIcon() {
    return GestureDetector(
      child: Image.asset(
        'assets/icons/settings.png',
        width: 22.w,
        height: 22.h,
      ),
    );
  }

  Widget _buildChatIcon() {
    return GestureDetector(
      child: Image.asset(
        'assets/icons/chat.png',
        width: 22.w,
        height: 22.h,
        color: primaryColor,
      ),
    );
  }

  Widget _buildHeaderText() {
    return Container(
      margin: EdgeInsets.only(top: 44.h),
      child: Text(
        'Find Your Best Furniture\nFor Your House.',
        style: primaryTextStyle.copyWith(
          fontSize: 24.sp,
          fontWeight: bold,
        ),
      ),
    );
  }

  Widget _buildSearchRow() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Row(
        children: [
          _buildSearchFormField(),
          _buildFilterButton(),
        ],
      ),
    );
  }

  Widget _buildSearchFormField() {
    return const CustomTextFormField();
  }

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 46.h,
        margin: EdgeInsets.only(left: 20.w),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
            child: Image.asset(
          'assets/icons/filter.png',
          width: 25.w,
        )),
      ),
    );
  }

  Widget _buildCategoreis() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CategoriesItem(
              title: 'Kursi',
              isSelected: true,
            ),
            CategoriesItem(
              title: 'Sofa',
            ),
            CategoriesItem(
              title: 'Meja',
            ),
            CategoriesItem(
              title: 'Lampu',
            ),
            CategoriesItem(
              title: 'Lemari',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductByCategories() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productList
              .map(
                (product) => ProductCard(model: product),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPopularProduct() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPopularProductTitle(),
          _buildPopularProductList(),
        ],
      ),
    );
  }

  Widget _buildPopularProductTitle() {
    return Text(
      'Paling Populer',
      style: primaryTextStyle.copyWith(
        fontSize: 16.sp,
        fontWeight: semiBold,
      ),
    );
  }

  Widget _buildPopularProductList() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productList.reversed
              .map(
                (product) => ProductCard(model: product),
              )
              .toList(),
        ),
      ),
    );
  }
}
