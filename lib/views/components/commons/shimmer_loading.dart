// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:shimmer/shimmer.dart';

// class CacheImageWidget extends StatefulWidget {
//   const CacheImageWidget({super.key});

//   @override
//   State<CacheImageWidget> createState() => _CacheImageWidgetState();
// }

// class _CacheImageWidgetState extends State<CacheImageWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: Colors.grey.shade400,
//         highlightColor: Colors.grey.shade300,
//         enabled: true,
//         child: ListView.builder(
//           itemBuilder: (_, __) => Padding(
//             padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: 48.0,
//                   height: 48.0,
//                   color: Colors.white,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         width: double.infinity,
//                         height: 8.0,
//                         color: Colors.white,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 2.0),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 8.0,
//                         color: Colors.white,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 2.0),
//                       ),
//                       Container(
//                         width: 40.0,
//                         height: 8.0,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           itemCount: 6,
//         ));

//     // CachedNetworkImage(
//     //   imageUrl:
//     //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTus_gWso6gF6nj8_d9LncWXFphmHgbK4Ad4A&usqp=CAU",
//     //   height: 100,
//     //   width: 100,
//     //   placeholder: (context, url) => Shimmer.fromColors(
//     //       baseColor: Colors.grey.shade500,
//     //       highlightColor: Colors.grey.shade200,
//     //       enabled: true,
//     //       child: Container(
//     //         height: 100,
//     //         width: 100,
//     //       )),
//     //   errorWidget: (context, url, error) => new Icon(Icons.error),
//     // );
//   }
// }
