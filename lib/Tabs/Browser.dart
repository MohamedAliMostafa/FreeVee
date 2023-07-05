
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Screens/ListDiscover.dart';
import 'package:movies/Features/Widgets/CatBrows.dart';

import '../Model/BrowCategory/BrowCat.dart';
import '../Shared/Remote/Api_Manager.dart';
class Browser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: Container(
        margin: REdgeInsets.only(top: 30,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Browse Category",style: TextStyle(color: Colors.white,fontSize: 22.sp),),
            FutureBuilder<BrowCat>(
              future: ApiManager.catBrowser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: GridView.builder(
                      itemCount: snapshot.data?.genres?.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 38,mainAxisSpacing: 48 ), itemBuilder: (context, index) {
                      List<Genres>ListCat=snapshot.data?.genres??[];
                      Genres cat=ListCat[index]  ;
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ListDiscover.RouteName,arguments: cat);
                          },
                          child: CatBrows(cat.name??""));
                    },),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
