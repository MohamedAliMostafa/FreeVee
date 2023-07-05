import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatBrows extends StatelessWidget {
String name;

CatBrows(this.name);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 158.w,
      height: 90.h,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
          image: DecorationImage(image: AssetImage("assets/images/imgCate/$name.jpeg"),fit: BoxFit.cover)
      ),
      child: Padding(
        padding:  REdgeInsets.symmetric(vertical: 70,horizontal: 40),
        child: Card(
            color: Colors.black.withOpacity(0.56),
            child: Center(child: Text(name,style: TextStyle(fontSize:14.sp,color: Colors.white,fontWeight: FontWeight.bold ),))),
      ),
    );
  }

}
