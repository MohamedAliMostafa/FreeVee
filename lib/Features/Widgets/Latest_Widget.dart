import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Widgets/Icons_WatchList.dart';

class LatestWidget extends StatelessWidget {

String img;

 LatestWidget(this.img);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 97.w,
          height: 128.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(img))
          ),


        ),
      /*  Positioned(
          top: -33,
            left: -10,
        //    child: IconWathcList()
        ),

       */
      ],
    );
  }
}
