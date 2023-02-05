import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikeda_furniture/shared/theme.dart';
import 'package:ikeda_furniture/view/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      bottomNavigationBar: _bottomNavbar(),
      body: _buildContent(),
    );
  }

  Widget _bottomNavbar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      elevation: 0,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Container(
            margin: EdgeInsets.only(
              top: 28.h,
            ),
            child: Image.asset(
              'assets/icons/home.png',
              width: 22.w,
              height: 24.h,
              color: currentIndex == 0 ? primaryColor : primaryTextColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Container(
            margin: EdgeInsets.only(
              top: 28.h,
            ),
            child: Image.asset(
              'assets/icons/cart.png',
              width: 22.w,
              height: 24.h,
              color: currentIndex == 1 ? primaryColor : primaryTextColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Container(
            margin: EdgeInsets.only(
              top: 26.h,
            ),
            child: Image.asset(
              'assets/icons/popular.png',
              width: 20.w,
              height: 26.h,
              color: currentIndex == 2 ? primaryColor : primaryTextColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Container(
            margin: EdgeInsets.only(
              top: 28.h,
            ),
            child: Image.asset(
              'assets/icons/account.png',
              width: 22.w,
              height: 24.h,
              color: currentIndex == 3 ? primaryColor : primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (currentIndex) {
      case 0:
        return  HomePage();
      default:
        return  HomePage();
    }
  }
}
