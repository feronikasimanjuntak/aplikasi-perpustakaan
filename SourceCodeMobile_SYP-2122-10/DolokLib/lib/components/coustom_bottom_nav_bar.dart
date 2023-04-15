import 'package:DolokLib/features/book/pages/book_page.dart';
import 'package:DolokLib/features/gallery/pages/gallery_page.dart';
import 'package:DolokLib/features/history/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/screens/home/home_screen.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
    VoidCallback? onLogoutPressed,
  }) :  _onLogoutPressed = onLogoutPressed,
        super(key: key);

  final MenuState selectedMenu;
  final VoidCallback? _onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.book,
                  color: MenuState.buku == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(BookPage.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(HistoryPage.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.photo,
                  color: MenuState.logout == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(GalleryPage.routeName),
              ),
            ],
          )),
    );
  }
}
