import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CacheImageWidget extends StatefulWidget {
  const CacheImageWidget({super.key, this.imageUrl, this.width, this.height});

  final imageUrl;
  final width;
  final height;

  @override
  State<CacheImageWidget> createState() => _CacheImageWidgetState();
}

class _CacheImageWidgetState extends State<CacheImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl!,
      height: widget.width,
      width: widget.height,
      placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade200,
          enabled: true,
          child: Container(
            height: 100,
            width: 100,
          )),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
