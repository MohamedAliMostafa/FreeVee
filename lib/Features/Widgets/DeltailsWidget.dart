import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWidget extends StatelessWidget {
String baimage;
String title;
String date;
String  posImage;
String  overview;
String  rate;


DetailsWidget({required this.baimage, required this.title, required this.date, required this.posImage,
      required this.overview, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: REdgeInsets.symmetric(vertical: 10),
            width: 412.w,
            height: 217.h,
            decoration:  BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(baimage),
              ),
            ),
            child: const Center(
                child: Icon(
                  Icons.play_circle_rounded,
                  size: 70,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding:  REdgeInsets.only(left: 20),
            child: Text(title,style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding:  REdgeInsets.only(left: 20),
            child: Text(date.substring(0,11),style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  REdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 129.w,
                  height: 199.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(posImage),
                      )
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Container(
                        padding: REdgeInsets.only(left: 10),
                        width: 231.w,
                        height: 134.h,
                        child:ListView(
                          children: [
                            Expanded(child: Text(overview,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600,color: Colors.white,),)),
                          ],
                        )

                    ),
                    Padding(

                      padding: REdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.star,color: Color(0xffFFBB3B),size: 15,),
                          Text(rate,style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],),

              ],
            ),
          )

        ],
      ),
    );
  }
}
