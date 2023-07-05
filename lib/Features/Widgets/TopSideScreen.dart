import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/TopSide/Results.dart';
import 'Icons_WatchList.dart';

class TopSide extends StatefulWidget {
  static const String RouteName = "top";
  Results results;
//  String? imageBackDrop;
 // String? image_Poster;
 // String? Title;

 // String? Date;

  TopSide({required this.results});

  @override
  State<TopSide> createState() => _TopSideState();
}

class _TopSideState extends State<TopSide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff121312),
      height: 180,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CachedNetworkImage(
            imageUrl: widget.results.backdropPath ?? "",
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: -20,
          left: 0,
          child: Container(
            padding: REdgeInsets.only(top: 60),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.results.posterPath ?? ""))),
                  width: 90,
                  height: 200,
                  margin: REdgeInsets.only(left: 10, bottom: 20),
                ),
                IconWathcList(results: widget.results,)
              ],
            ),
          ),
        ),
        Positioned(
          top: 205,
          left: 100,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.results.originalTitle ?? "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.results.releaseDate ?? "",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
              ],
            ),
          ),
        ),
        const Positioned(
            top: 70,
            left: 140,
            child: Icon(
              Icons.play_circle_rounded,
              size: 70,
              color: Colors.white,
            ))
      ]),
    );
  }
}
