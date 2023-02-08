// // ignore_for_file: depend_on_referenced_packages
// import 'package:learn_with_mimi/configs/app_colors.dart';
// import 'package:learn_with_mimi/configs/app_constants.dart';
// import 'package:learn_with_mimi/configs/app_navi_drawer_items.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/config.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:learn_with_mimi/providers/theme_provider.dart';
// import 'package:learn_with_mimi/utils/support_color.dart';
// import 'package:provider/provider.dart';
// import 'dart:async';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

// final ZoomDrawerController naviDrawerController = ZoomDrawerController();

// class UserLayoutStyle2 extends StatefulWidget {
//   const UserLayoutStyle2({
//     super.key,
//     this.naviDrawerController,
//     this.childWidget,
//   });

//   final naviDrawerController;
//   final childWidget;

//   @override
//   State<UserLayoutStyle2> createState() => _UserLayoutStyle2State();
// }

// class _UserLayoutStyle2State extends State<UserLayoutStyle2>
//     with TickerProviderStateMixin {
//   final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0; //default index of a first screen

//   late AnimationController _fabAnimationController;
//   late AnimationController _borderRadiusAnimationController;
//   late Animation<double> fabAnimation;
//   late Animation<double> borderRadiusAnimation;
//   late CurvedAnimation fabCurve;
//   late CurvedAnimation borderRadiusCurve;
//   late AnimationController _hideBottomBarAnimationController;

//   final iconList = <IconData>[
//     Icons.brightness_5,
//     Icons.brightness_4,
//     Icons.brightness_6,
//     Icons.brightness_7,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final systemTheme = SystemUiOverlayStyle.light.copyWith(
//       systemNavigationBarColor: HexColor('#373A36'),
//       systemNavigationBarIconBrightness: Brightness.light,
//     );
//     SystemChrome.setSystemUIOverlayStyle(systemTheme);

//     _fabAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _borderRadiusAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     fabCurve = CurvedAnimation(
//       parent: _fabAnimationController,
//       curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//     borderRadiusCurve = CurvedAnimation(
//       parent: _borderRadiusAnimationController,
//       curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );

//     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
//     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
//       borderRadiusCurve,
//     );

//     _hideBottomBarAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );

//     Future.delayed(
//       const Duration(seconds: 1),
//       () => _fabAnimationController.forward(),
//     );
//     Future.delayed(
//       const Duration(seconds: 1),
//       () => _borderRadiusAnimationController.forward(),
//     );
//   }

//   bool onScrollNotification(ScrollNotification notification) {
//     if (notification is UserScrollNotification &&
//         notification.metrics.axis == Axis.vertical) {
//       switch (notification.direction) {
//         case ScrollDirection.forward:
//           _hideBottomBarAnimationController.reverse();
//           _fabAnimationController.forward(from: 0);
//           break;
//         case ScrollDirection.reverse:
//           _hideBottomBarAnimationController.forward();
//           _fabAnimationController.reverse(from: 1);
//           break;
//         case ScrollDirection.idle:
//           break;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
//     final bool isDarkMode = themeProvider.isDarkMode;
//     // final Map<String, Color> themeColors =
//     //     isDarkMode ? AppColors.darkColors : AppColors.lightColors;
//     final listNaviItems = AppNaviDrawerItems.listItemsBeforeLogin;
//     final size = MediaQuery.of(context).size;

//     return ZoomDrawer(
//       controller: naviDrawerController,
//       borderRadius: 24,
//       style: DrawerStyle.defaultStyle,
//       showShadow: true,
//       openCurve: Curves.fastOutSlowIn,
//       slideWidth: size.width * 0.80,
//       duration: const Duration(milliseconds: 500),
//       angle: 0.0,
//       menuBackgroundColor: Colors.indigoAccent,
//       menuScreen: Scaffold(
//         backgroundColor: Colors.indigoAccent,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 50, left: 25),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       width: 100.0,
//                       height: 100.0,
//                       decoration: BoxDecoration(
//                         color: const Color(0xff7c94b6),
//                         image: const DecorationImage(
//                           image: NetworkImage('https://bit.ly/3QSDeaW'),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(50.0),
//                         ),
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 4.0,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       AppConstants.titleDrawerMenu,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const Text(
//                       AppConstants.email,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const Divider(
//                       height: 1,
//                       thickness: 1,
//                       color: Colors.white,
//                       indent: 3,
//                       endIndent: 3,
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView(
//                     padding: EdgeInsets.zero,
//                     children: [
//                       ...listNaviItems.map(
//                         (naviItem) => ListTile(
//                           minLeadingWidth: 10,
//                           leading: naviItem['icon']! as Icon,
//                           title: Text(
//                             naviItem['title']! as String,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       mainScreen: Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           padding: const EdgeInsets.only(top: 50),
//           color: Colors.indigoAccent,
//           child: Column(
//             // primary: false,
//             // shrinkWrap: false,
//             children: [],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: HexColor('#FFA400'),
//           child: Icon(
//             Icons.brightness_3,
//             color: HexColor('#373A36'),
//           ),
//           onPressed: () {
//             _fabAnimationController.reset();
//             _borderRadiusAnimationController.reset();
//             _borderRadiusAnimationController.forward();
//             _fabAnimationController.forward();
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           itemCount: iconList.length,
//           tabBuilder: (int index, bool isActive) {
//             final color = isActive ? HexColor('#FFA400') : Colors.white;
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   iconList[index],
//                   size: 24,
//                   color: color,
//                 ),
//                 const SizedBox(height: 4),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: AutoSizeText(
//                     "Button $index",
//                     maxLines: 1,
//                     style: TextStyle(color: color),
//                     group: autoSizeGroup,
//                   ),
//                 )
//               ],
//             );
//           },
//           backgroundColor: HexColor('#373A36'),
//           activeIndex: _bottomNavIndex,
//           splashColor: HexColor('#FFA400'),
//           notchAndCornersAnimation: borderRadiusAnimation,
//           splashSpeedInMilliseconds: 300,
//           notchSmoothness: NotchSmoothness.defaultEdge,
//           gapLocation: GapLocation.center,
//           leftCornerRadius: 32,
//           rightCornerRadius: 32,
//           onTap: (index) => setState(() => _bottomNavIndex = index),
//           hideAnimationController: _hideBottomBarAnimationController,
//           shadow: BoxShadow(
//             offset: const Offset(0, 1),
//             blurRadius: 12,
//             spreadRadius: 0.5,
//             color: HexColor('#FFA400'),
//           ),
//         ),
//       ),
//     );
//   }
// }
