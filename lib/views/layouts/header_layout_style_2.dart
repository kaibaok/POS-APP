// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/utils/support_color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class HeaderLayoutStyle2 extends StatelessWidget {
  const HeaderLayoutStyle2({
    super.key,
    required this.size,
    required this.title,
    this.titleColor,
  });

  final size;
  final title;
  final titleColor;

  @override
  Widget build(BuildContext context) {
    final autoSizeGroup = AutoSizeGroup();
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;
    final size = MediaQuery.of(context).size;

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
            children: [
              IconButton(
                color: titleColor != null
                    ? HexColor(theme[titleColor].toString())
                    : HexColor(theme['icon_default'].toString()),
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Container(
                width: size.width - 100,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 20),
                child: Hero(
                  tag: title,
                  child: AutoSizeText(
                    StringExtension.capitalize(title.toString()),
                    maxLines: 1,
                    group: autoSizeGroup,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: titleColor != null
                          ? HexColor(theme[titleColor].toString())
                          : HexColor(theme['title_default'].toString()),
                    ),
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
