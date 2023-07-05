import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Widgets/Icons_WatchList.dart';
import 'package:movies/Model/TopSide/Results.dart';

class SearchItem extends StatelessWidget {

  Results results;


  SearchItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: REdgeInsets.only(left: 30),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                      width: 140.w,
                      height: 89.h,
                      child: Image.network(
                        results.backdropPath??"",
                        fit: BoxFit.cover,
                      )),
                 Positioned(top: -33, left: -10, child: IconWathcList(results: results,)),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 80.h,
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      results.originalTitle??"",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                    Text(
                      results.releaseDate!.substring(0, 4),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.56),
                          fontSize: 15.sp),
                    ),
                    Text(
                      results.title??"",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.56),
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 15,
          color: Colors.white.withOpacity(0.56),
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
