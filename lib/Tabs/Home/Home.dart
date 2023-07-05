import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Screens/Details.dart';
import 'package:movies/Features/Widgets/Top_Rated.dart';
import 'package:movies/Model/TopRated/TopRated.dart';
import 'package:movies/Model/TopSide/Results.dart';
import 'package:movies/Model/TopSide/TopSideSection.dart';
import 'package:movies/Shared/Remote/Api_Manager.dart';
import '../../Core/Images/images.dart';
import '../../Features/Widgets/Latest_Widget.dart';
import '../../Features/Widgets/TopSideScreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var l = latestImages();
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // Top_SIDE
            FutureBuilder<TopSideSection>(
              future: ApiManager.getPopularTopSide(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.results?.length,
                    itemBuilder: (context, index) {
                      List<Results> ListRes = snapshot.data?.results ?? [];
                      Results res = ListRes[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Details.RouteNAME,
                              arguments: res);
                        },
                        child: TopSide(
                            results: res,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            //latest
            Container(
              padding: REdgeInsets.only(left: 5),
              height: 150.h,
              color: const Color(0xff707070).withOpacity(0.56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Release",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: l.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: REdgeInsets.only(left: 10),
                          child: LatestWidget(l[index]));
                    },
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            //TopRated
            Container(
              padding: REdgeInsets.only(left: 10),
              margin: REdgeInsets.symmetric(vertical: 10),
              height: 180,
              color: const Color(0xff707070).withOpacity(0.56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Rated",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  FutureBuilder<TopRated>(
                      future: ApiManager.getTopRated(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error.toString()}");
                        }

                        return Expanded(
                          child: Container(
                            margin: REdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.results!.length,
                              itemBuilder: (context, index) {
                                List<Results> L = snapshot.data?.results ?? [];
                                Results res = L[index];
                                return Card(
                                    color: Colors.grey,
                                    elevation: 15,
                                    // color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.r)),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Details.RouteNAME,
                                              arguments: res);
                                        },
                                        child: TopRatedWidget(rated: res)));
                              },
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
