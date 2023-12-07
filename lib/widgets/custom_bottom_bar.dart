import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkHome,
      activeIcon: ImageConstant.imgIconlyBulkHome,
      type: BottomBarEnum.Iconlybulkhome,
    ),
    BottomMenuModel(
      icon: ImageConstant.img290138Document,
      activeIcon: ImageConstant.img290138Document,
      type: BottomBarEnum.document,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyLightProfile,
      activeIcon: ImageConstant.imgIconlyLightProfile,
      type: BottomBarEnum.Iconlylightprofile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 32.adaptSize,
              width: 32.adaptSize,
              color: appTheme.gray500,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 32.adaptSize,
              width: 32.adaptSize,
              color: theme.colorScheme.primary,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Iconlybulkhome,
  document,
  Iconlylightprofile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
