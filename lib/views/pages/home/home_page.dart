// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/utils/support_color.dart';
import 'package:pos/views/components/commons/change_theme_button_widget.dart';
import 'package:pos/views/layouts/user_layout_style_1.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos/views/pages/home/home_block_1.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserLayoutStyle1(
      childWidget: const BodyPage(),
      title: StringExtension.capitalize("app_name".tr(args: ["🐱"])),
    );
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({
    super.key,
  });

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    // final autoSizeGroup = AutoSizeGroup();
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;

    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 30.0,
      ),
      decoration: BoxDecoration(
        color: HexColor(theme['home_body'].toString()),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          HomeBlock1(),
          ChangeThemeButtonWidget(),
        ],
      ),
    );
  }
}
