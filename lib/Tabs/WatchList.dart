import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Shared/Local/Hive.dart';

class WatchList extends StatelessWidget {
bool w=true;

  @override
  Widget build(BuildContext context) {
    var p=Provider.of<Hiv>(context);
    p.getData();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("WatchList",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      floatingActionButton:Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2.w),
              borderRadius: BorderRadius.circular(32.r)
        ),
        child: IconButton(
          splashColor: Colors.yellowAccent,
          onPressed: () {
          p.deleteAllData();
        },icon:const Icon(Icons.delete,color: Colors.red,size: 30,),),
      ) ,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: p.watchListData.length,
              itemBuilder: (context, index) {
              return  Column(
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
                                  p.watchListData[index]["image"],
                                  fit: BoxFit.cover,
                                )),
                            Positioned(top: -33, left: -10, child:InkWell(
                              onTap: () {
                                p.deleteData(p.watchListData[index]["key"]);
                              },
                              child: Container(
                                margin: REdgeInsets.only(left: 10,top: 40),
                                width: 20.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    image:DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(w==false?"assets/images/bookmark.png":"assets/images/true.png"))),
                              ),
                            )),
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
                                p.watchListData[index]["title"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                              Text(
                                p.watchListData[index]["date"],
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.56),
                                    fontSize: 15.sp),
                              ),
                              Text(
                                p.watchListData[index]["Temp"],
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
            },),
          )
        ],
      ),
    );
  }
}
