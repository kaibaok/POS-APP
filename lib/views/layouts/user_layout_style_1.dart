// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:pos/configs/app_colors.dart';
import 'package:pos/configs/app_constants.dart';
import 'package:pos/configs/app_navi_drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pos/configs/route.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/support_color.dart';
import 'package:pos/views/layouts/header_layout_style_1.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:page_transition/page_transition.dart';

final ZoomDrawerController naviDrawerController = ZoomDrawerController();

class UserLayoutStyle1 extends StatefulWidget {
  const UserLayoutStyle1({
    super.key,
    this.naviDrawerController,
    this.childWidget,
    this.title,
  });

  final naviDrawerController;
  final childWidget;
  final title;

  @override
  State<UserLayoutStyle1> createState() => _UserLayoutStyle1State();
}

class _UserLayoutStyle1State extends State<UserLayoutStyle1>
    with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();

  Widget loadNaviItems(listNaviItems, theme) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...listNaviItems.map(
          (naviItem) => InkWell(
            highlightColor:
                HexColor(theme['left_navi_item_highlight'].toString())
                    .withOpacity(0.2),
            splashColor:
                HexColor(theme['left_navi_item_splashColor'].toString())
                    .withOpacity(0.8),
            child: ListTile(
              minLeadingWidth: 10,
              leading: Icon(
                naviItem['icon']!,
                color: HexColor(theme['title_default'].toString()),
              ),
              title: Text(
                naviItem['title']!,
                style: TextStyle(
                    color: HexColor(theme['title_default'].toString())),
              ),
            ),
            onTap: () {
              naviDrawerController.toggle!();
              var route = routes[naviItem['url'].toString()];
              Navigator.push(
                context,
                PageTransition(
                  type: route['transition']!,
                  child: route['route_path'],
                  childCurrent: route['childCurrent'],
                  alignment: route['alignment'],
                  duration: Duration(
                    milliseconds: route['duration'],
                  ),
                  reverseDuration: Duration(
                    milliseconds: route['duration'],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;
    // bool isLogined = false;
    var listNaviItems = AppNaviDrawerItems.listItemsBeforeLogin;
    // if (isLogined) {
    //   listNaviItems = AppNaviDrawerItems.listItemsAfterLogin;
    // }
    final size = MediaQuery.of(context).size;
    return ZoomDrawer(
      controller: naviDrawerController,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: size.width * 0.80,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      menuBackgroundColor: HexColor(theme['app_background'].toString()),
      menuScreen: Scaffold(
        backgroundColor: HexColor(theme['app_background'].toString()),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/7649/7649606.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        border: Border.all(
                          color: HexColor(theme['avatar_border'].toString()),
                          width: 4.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppConstants.titleDrawerMenu,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: HexColor(theme['title_default'].toString()),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Text(
                        AppConstants.email,
                        style: TextStyle(
                          color: HexColor(theme['title_default'].toString()),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: HexColor(theme['title_default'].toString()),
                      indent: 3,
                      endIndent: 3,
                    ),
                  ],
                ),
                Expanded(
                  child: loadNaviItems(listNaviItems, theme),
                ),
              ],
            ),
          ),
        ),
      ),
      mainScreen: Scaffold(
        backgroundColor: HexColor(theme['main_screen_background'].toString()),
        body: Container(
          color: HexColor(theme['app_background'].toString()),
          child: SafeArea(
            child: Column(
              // primary: false,
              // shrinkWrap: false,
              children: [
                HeaderLayoutStyle1(
                  title: widget.title,
                  naviDrawerController: naviDrawerController,
                  size: size,
                ),
                Expanded(child: widget.childWidget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
