import 'package:flutter/material.dart';

class SearchCommonWidget extends StatelessWidget {
  const SearchCommonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
      ),
    );
  }
}
