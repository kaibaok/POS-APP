// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:pos/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/support_color.dart';
import 'package:pos/views/components/commons/cache_image_widget.dart';
import 'package:pos/views/components/commons/change_theme_button_widget.dart';
import 'package:pos/views/layouts/header_layout_style_2.dart';
import 'package:provider/provider.dart';

class UserLayoutStyle2 extends StatefulWidget {
  const UserLayoutStyle2({
    super.key,
    this.childWidget,
    required this.title,
    this.titleColor,
    this.background,
  });

  final childWidget;
  final title;
  final titleColor;
  final background;

  @override
  State<UserLayoutStyle2> createState() => _UserLayoutStyle2State();
}

class _UserLayoutStyle2State extends State<UserLayoutStyle2> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor(theme['main_screen_background'].toString()),
      body: Container(
        color: widget.background != null
            ? HexColor(theme[widget.background].toString())
            : HexColor(theme['app_background'].toString()),
        child: SafeArea(
          child: Column(
            children: [
              HeaderLayoutStyle2(
                title: widget.title,
                size: size,
                titleColor: widget.titleColor,
              ),
              Expanded(child: widget.childWidget),
            ],
          ),
        ),
      ),
    );
  }
}
