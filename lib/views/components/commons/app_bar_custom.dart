// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    this.naviDrawerController,
    this.actionsAppBar,
    this.titleAppBar,
    this.enableMenuAppBar,
    this.themeColors,
  });

  final naviDrawerController;
  final actionsAppBar;
  final titleAppBar;
  final enableMenuAppBar;
  final themeColors;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          themeColors['backgroundColorAppBar'] ?? Colors.purpleAccent,
      title: titleAppBar ?? const Text(''),
      centerTitle: true,
      actions: List<Widget>.from(actionsAppBar),
      leading: enableMenuAppBar == null || enableMenuAppBar == false
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                naviDrawerController.toggle!();
              },
            ),
    );
  }
}
