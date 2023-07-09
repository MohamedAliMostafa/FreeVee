import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Model/Similar/Similar.dart';
import 'package:movies/Model/TopSide/Results.dart';

import '../../Model/DetailsModel/DetailsModel.dart';
import '../../Shared/Remote/Api_Manager.dart';
import '../Widgets/Similarwidget.dart';

class Details extends StatelessWidget {
  static const String RouteNAME = "DE";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
      backgroundColor:const Color(0xff121312) ,
      appBar: AppBar(
        backgroundColor: const Color(0xff121312),
        title: Text(args.originalTitle!,style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
      ),
      body: Column(children: [
        FutureBuilder<DetailsModel>(
          future: ApiManager.getDetails(args.id!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString(),style: TextStyle(color: Colors.cyan),));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            var det=snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: REdgeInsets.symmetric(vertical: 10),
                  width: 412.w,
                  height: 217.h,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(det!.backdropPath??""),
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
                  child: Text(det.originalTitle??"",style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:  REdgeInsets.only(left: 20),
                  child: Text(det.releaseDate!.substring(0,4),style: TextStyle(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.bold)),
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
                              image: NetworkImage(det.posterPath??""),
                            )
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Container(
                            padding: REdgeInsets.only(left: 10),
                            width: 260.w,
                            height: 25.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: det.genres!.length,
                              itemBuilder: (context, index) {
                                return Container(margin: REdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 2.w),
                                  ),
                                  child: Center(child: Text(snapshot.data!.genres![index].name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp,color: Color(0xffFFBB3B)),)),
                                );

                            },),
                          ),
                            Container(
                              padding: REdgeInsets.only(left: 10),
                                width: 231.w,
                                height: 100.h,
                                child:ListView(
                                  children: [
                                     Text(det.overview??"".substring(0,10),style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600,color: Colors.white,),),
                                  ],
                                )

                            ),
                            Padding(

                              padding: REdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.star,color: Color(0xffFFBB3B),size: 15,),
                                  Text(det.voteAverage.toString(),style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold))
                                ],
                              ),
                            )
                          ],),

                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.only(left: 10),
                  margin: REdgeInsets.symmetric(vertical: 10),
                  height: 170,
                  color: const Color(0xff707070).withOpacity(0.56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("More Like This",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp,color: Colors.white),),
                      FutureBuilder<Similar>(
                          future: ApiManager.getSimilar(args.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error.toString()}dsasdas");
                            }

                            return Expanded(
                              child: Container(
                                margin: REdgeInsets.only(bottom: 10),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.results?.length,
                                  itemBuilder: (context, index) {
                                    List<Results> L = snapshot.data?.results ?? [];
                                    Results res = L[index];

                                    return Card(
                                        color: Colors.grey,
                                        elevation: 15,
                                        // color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(32.r)
                                        ),
                                        child: Smilarwidget(res));


                                  },
                                ),
                              ),
                            );

                          }),

                    ],
                  ),
                ),

              ],
            );

          },
        ),
      ],)
    );
  }
}
