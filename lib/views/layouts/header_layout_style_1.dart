// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/support_color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

class HeaderLayoutStyle1 extends StatelessWidget {
  const HeaderLayoutStyle1({
    super.key,
    required this.naviDrawerController,
    required this.size,
    required this.title,
  });

  final naviDrawerController;
  final size;
  final title;

  @override
  Widget build(BuildContext context) {
    final autoSizeGroup = AutoSizeGroup();
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;

    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        bottom: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: HexColor(theme['icon_default'].toString()),
                icon: const Icon(Icons.menu),
                onPressed: () {
                  naviDrawerController!.toggle!();
                },
              ),
              Container(
                width: size.width - 100,
                padding: const EdgeInsets.only(right: 10),
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  group: autoSizeGroup,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: HexColor(theme['title_default'].toString()),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
