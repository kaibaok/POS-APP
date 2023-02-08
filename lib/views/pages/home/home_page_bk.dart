// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pos/utils/string_extension.dart';
import 'package:pos/views/components/commons/text_stroke.dart';
import 'package:pos/views/layouts/user_layout_style_1.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';

const List<Map<String, String>> listImages = [
  {
    "name": "basic",
    "url":
        "https://img.freepik.com/premium-vector/koala-animal-cartoon-colored-clipart-illustration_576561-2015.jpg?w=2000",
  },
  {
    "name": "medium",
    "url":
        "https://www.clipartmax.com/png/middle/467-4678093_cartoon-animals-clipart-round-animal-pig-clip-art.png",
  },
  {
    "name": "advanced",
    "url":
        "https://toppng.com/uploads/preview/clip-art-download-baby-cartoon-animals-clip-art-use-zoo-animals-clipart-115629213227snltwxols.png",
  },
  {
    "name": "higher_advanced",
    "url":
        "https://png.clipart.me/image_preview/573/cartoon-bunny-clip-art-42053.jpg",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserLayoutStyle1(
      childWidget: const BodyPage(),
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
    final autoSizeGroup = AutoSizeGroup();
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 10.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5, right: 10.0),
            child: AutoSizeText(
              StringExtension.capitalize("vocabulary".tr()),
              maxLines: 1,
              group: autoSizeGroup,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent.shade700,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade200,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: GridView.custom(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: listImages.length,
                (context, index) {
                  return GridTile(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    listImages[index]['url']!.toString()),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.7),
                                  BlendMode.modulate,
                                )),
                          ),
                        ),
                        Positioned(
                          left: 5.0,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Center(
                                child: TextStroke(
                              textBody: StringExtension.capitalize(
                                  listImages[index]['name']!.toString().tr()),
                              fontSize: 15.0,
                              strokeWidth: 5.0,
                              colorStroke: Colors.blueAccent,
                              colorText: Colors.white,
                              maxLines: 1,
                            )),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
            child: AutoSizeText(
              StringExtension.capitalize("vocabulary".tr()),
              maxLines: 1,
              group: autoSizeGroup,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent.shade700,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade200,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: size.width / 4,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width / 4,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width / 4,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width / 4,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.red,
            height: 100,
            child: Center(child: Text('asdas')),
          ),
          Card(
            elevation: 1,
            child: InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Image.network(
                    "https://img.freepik.com/premium-vector/koala-animal-cartoon-colored-clipart-illustration_576561-2015.jpg?w=2000",
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: FractionallySizedBox(
                      heightFactor: 0.25,
                      alignment: Alignment.bottomCenter,
                      child: ColoredBox(
                        color: Colors.black.withOpacity(0.75),
                        child: Center(
                          child: Text(
                            'aaaa',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
