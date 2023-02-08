// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:pos/configs/app_colors.dart';
import 'package:pos/configs/fake_data.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/utils/support_color.dart';
import 'package:pos/views/components/commons/cache_image_widget.dart';
import 'package:pos/views/layouts/user_layout_style_2.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';

class VocabularyCategoryPage extends StatefulWidget {
  const VocabularyCategoryPage({super.key, this.arguments});

  final arguments;

  @override
  State<VocabularyCategoryPage> createState() => _VocabularCategoryPageState();
}

class _VocabularCategoryPageState extends State<VocabularyCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return UserLayoutStyle2(
      childWidget: BodyPage(item: widget.arguments),
      title: widget.arguments['name'].toString().tr(),
      background: widget.arguments['color']['background'],
      titleColor: widget.arguments['color']['title'],
    );
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({
    super.key,
    this.item,
  });

  final item;

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme =
        themeProvider.isDarkMode ? AppColors.darkColors : AppColors.lightColors;
    var item = widget.item;

    final listItems = FakeData.fakeVocabularyDetail[item['name']];

    Widget ItemGrid(item, theme) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/vocabulary/detail',
            arguments: {"name": "title"},
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                HexColor(theme[widget.item['color']['background'].toString()]),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: AutoSizeText(
                  StringExtension.capitalize(item['title'].toString()),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: HexColor(
                        theme[widget.item['color']['title'].toString()]),
                  ),
                  maxLines: 1,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Hero(
                  tag: item['title'],
                  child: item['enable_animation_image'] == true
                      ? Lottie.network(item['animation_image'].toString())
                      : CacheImageWidget(
                          imageUrl: item['image']!,
                        ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: size.width,
              margin: EdgeInsets.only(top: 75.0),
              padding: EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
              decoration: BoxDecoration(
                color: HexColor(theme['vocabulary_background'].toString()),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: size.width / 2 - 75,
              child: Hero(
                tag: item['url']!,
                child: CacheImageWidget(
                    imageUrl: item['url']!, width: 150.0, height: 150.0),
              ),
            ),
          ],
        ),
        Container(
          color: HexColor(theme['main_screen_background']),
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          height: size.height - 210 - 75,
          width: size.width,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: listItems!.length,
            itemBuilder: (context, index) {
              return ItemGrid(listItems[index], theme);
            },
          ),
        ),
      ],
    );
  }
}
