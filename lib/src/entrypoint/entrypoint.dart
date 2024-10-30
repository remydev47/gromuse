import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/src/categories/views/categories.dart';
import 'package:gromuse/src/controllers/bottomtabbar.dart';
import 'package:gromuse/src/delivery/views/delivery.dart';
import 'package:gromuse/src/favourite/views/favourite.dart';
import 'package:gromuse/src/home/views/home.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Entrypoint extends StatelessWidget {
  Entrypoint({super.key});

  List<Widget> pageList = [
    Home(),
    Categories(),
    Favourite(),
    Delivery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  selectedLabelStyle:
                      appStyle(9, Kolors.kDark, FontWeight.w700),
                  showUnselectedLabels: true,
                  currentIndex: tabIndexNotifier.index,
                  selectedItemColor: Kolors.kPrimaryDark,
                  unselectedIconTheme:
                      const IconThemeData(color: Kolors.kGrayLight),
                  selectedIconTheme:
                      const IconThemeData(color: Kolors.kPrimary),
                  onTap: (i) {
                    tabIndexNotifier.setIndex(i);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.home_filled,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.category_outlined,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Categories',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.favorite,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Favourite',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.delivery_dining,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Delivery',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
