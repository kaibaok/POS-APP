// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/configs/app_constants.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/utils/support_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pos/views/components/commons/cache_image_widget.dart';
import 'package:pos/views/layouts/user_layout_style_2.dart';
import 'package:provider/provider.dart';

const List<Map> listVocabulary = AppConstants.listVocabulary;

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  @override
  Widget build(BuildContext context) {
    return UserLayoutStyle2(
      childWidget: BodyPage(),
      title: "vocabulary".tr(),
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
  Widget CardItem(theme, size, item) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/vocabulary/category',
                arguments: item,
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 40.0, bottom: 10.0),
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 100,
                right: 20.0,
              ),
              constraints: BoxConstraints(
                maxHeight: 120.0,
              ),
              decoration: BoxDecoration(
                  color:
                      HexColor(theme[item['color']['background'].toString()]!)
                          .withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: size.width - 70,
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    StringExtension.capitalize(item['name']!.toString().tr()),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color:
                          HexColor(theme[item['color']['title']!.toString()]!),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 10,
            child: Hero(
              tag: item['url'],
              child: CacheImageWidget(
                  imageUrl: item['url']!, width: 100.0, height: 100.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;

    return Container(
      padding:
          EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: HexColor(theme['vocabulary_background'].toString()),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
        ),
      ),
      child: ListView.builder(
        itemCount: listVocabulary.length,
        itemBuilder: (context, index) =>
            CardItem(theme, size, listVocabulary[index]),
      ),
    );
  }
}
