import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/TopRated/TopRated.dart';
import '../../Model/TopSide/Results.dart';
import 'Icons_WatchList.dart';

class TopRatedWidget extends StatefulWidget {
  Results rated;
  bool w = true;

  TopRatedWidget({required this.rated});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 100.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0.r),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.rated.posterPath ?? ""),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(top: -30, left: -5, child: IconWathcList(results: widget.rated,)),
          Positioned(
            top: 110,
            child: Container(
              height: 60.h,
              width: 100.w,
              color: const Color(0xff707070),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Color(0xffFFBB3B),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(widget.rated.voteAverage.toString(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    widget.rated.title ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.sp,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  Text(
                    widget.rated.releaseDate ?? "",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
