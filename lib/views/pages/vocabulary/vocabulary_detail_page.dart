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

class VocabularyDetailPage extends StatefulWidget {
  const VocabularyDetailPage({super.key, this.arguments});

  final arguments;

  @override
  State<VocabularyDetailPage> createState() => _VocabularDetailPageState();
}

class _VocabularDetailPageState extends State<VocabularyDetailPage> {
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
      ],
    );
  }
}
