// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/configs/app_constants.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/utils/support_color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

const List<Map> listVocabulary = AppConstants.listVocabulary;

class HomeBlock1 extends StatefulWidget {
  const HomeBlock1({
    super.key,
  });
  @override
  State<HomeBlock1> createState() => _HomeBlock1State();
}

class _HomeBlock1State extends State<HomeBlock1> {
  Widget customItem(String url, String name, dynamic theme) {
    return Container(
        color: Colors.white,
        child: Stack(children: [
          Image.network(
            url,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: FractionallySizedBox(
              heightFactor: 0.20,
              alignment: Alignment.bottomCenter,
              child: ColoredBox(
                color: HexColor(theme['home_block_1_banner'].toString())
                    .withOpacity(0.70),
                child: Center(
                  child: AutoSizeText(
                    name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color:
                          HexColor(theme['home_block_1_subtitle'].toString()),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;

    return Column(
      children: [
        SizedBox(
          height: 30,
          width: MediaQuery.of(context).size.width,
          child: AutoSizeText(
            StringExtension.capitalize("vocabulary".tr()),
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor(theme['home_block_1_title'].toString()),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: HexColor(theme['home_block_1_background'].toString()),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: customItem(
                    listVocabulary[0]['url'].toString(),
                    StringExtension.capitalize(
                        listVocabulary[0]['name'].toString().tr()),
                    theme),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: customItem(
                  listVocabulary[3]['url'].toString(),
                  StringExtension.capitalize(
                      listVocabulary[3]['name'].toString().tr()),
                  theme,
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: customItem(
                  listVocabulary[1]['url'].toString(),
                  StringExtension.capitalize(
                      listVocabulary[1]['name'].toString()),
                  theme,
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: customItem(
                  listVocabulary[2]['url'].toString(),
                  StringExtension.capitalize(
                      listVocabulary[2]['name'].toString().tr()),
                  theme,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
