// // ignore_for_file: depend_on_referenced_packages, must_be_immutable, prefer_typing_uninitialized_variables
// import 'package:learn_with_mimi/configs/app_colors.dart';
// import 'package:learn_with_mimi/configs/app_constants.dart';
// import 'package:learn_with_mimi/configs/app_navi_drawer_items.dart';
// import 'package:learn_with_mimi/views/components/commons/app_bar_custom.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/config.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:learn_with_mimi/providers/theme_provider.dart';
// import 'package:provider/provider.dart';

// class UserLayout extends StatefulWidget {
//   UserLayout({
//     super.key,
//     required this.childWidget,
//     this.enableAppBar,
//     this.enableMenuAppBar,
//     this.actionsAppBar,
//     this.titleAppBar,
//     this.customAppBar,
//     required this.isLogined,
//     this.naviDrawerController,
//   });

//   final childWidget;
//   final enableAppBar;
//   final enableMenuAppBar;
//   final actionsAppBar;
//   final titleAppBar;
//   final customAppBar;
//   bool isLogined = false;
//   final naviDrawerController;

//   @override
//   State<UserLayout> createState() => _UserLayoutState();
// }

// class _UserLayoutState extends State<UserLayout> {
//   dynamic _renderAppBar(dynamic themeColors) {
//     var enableAppBar = widget.enableAppBar;
//     var customAppBar = widget.customAppBar;

//     if (enableAppBar == null || enableAppBar == false) {
//       return null;
//     }
//     if (customAppBar != null) {
//       return customAppBar;
//     }

//     return AppBarCustom(
//       naviDrawerController: widget.naviDrawerController!,
//       titleAppBar: widget.titleAppBar,
//       actionsAppBar: widget.actionsAppBar ?? [],
//       enableMenuAppBar: widget.enableMenuAppBar ?? false,
//       themeColors: themeColors,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
//     final bool isDarkMode = themeProvider.isDarkMode;
//     final Map<String, Color> themeColors =
//         isDarkMode ? AppColors.darkColors : AppColors.lightColors;

//     final listNaviItems = widget.isLogined
//         ? AppNaviDrawerItems.listItemsAfterLogin
//         : AppNaviDrawerItems.listItemsBeforeLogin;

//     final size = MediaQuery.of(context).size;

//     return ZoomDrawer(
//       controller: widget.naviDrawerController!,
//       borderRadius: 24,
//       style: DrawerStyle.defaultStyle,
//       showShadow: true,
//       openCurve: Curves.fastOutSlowIn,
//       slideWidth: size.width * 0.80,
//       duration: const Duration(milliseconds: 500),
//       angle: 0.0,
//       menuBackgroundColor:
//           themeColors['menuBackgroundColor'] ?? Colors.indigoAccent,
//       mainScreen: Scaffold(
//         backgroundColor: themeColors['mainScreen'] ?? Colors.white,
//         appBar: _renderAppBar(themeColors),
//         body: widget.childWidget,
//       ),
//       menuScreen: Scaffold(
//         backgroundColor:
//             themeColors['menuBackgroundColor'] ?? Colors.indigoAccent,
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
//     );
//   }
// }
