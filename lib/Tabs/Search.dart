import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Widgets/SearchItem.dart';

import '../Features/Screens/Details.dart';
import '../Model/SeachMovie/SearchMovie.dart';
import '../Model/TopSide/Results.dart';
import '../Shared/Remote/Api_Manager.dart';

class SearchMovies extends StatefulWidget {
  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  var searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff514F4F).withOpacity(0.58),
                  borderRadius: BorderRadius.circular(32.r)),
              child: TextField(
                mouseCursor: MouseCursor.uncontrolled,
                style: const TextStyle(color: Colors.white),
               onChanged: (value) {
                 setState(() {
                   searchControl;
                 });
               },

                cursorColor: const Color(0xff48CFAD),
                controller: searchControl,
                decoration: InputDecoration(

                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.46)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.r),
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 2.w)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.r),
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 2.w)),
                ),
              ),
            ),
          ),
          FutureBuilder<SearchMovie>(
              future: ApiManager.searchMov(searchControl.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error.toString()}");
                }
              //

                return Expanded(
                  child:searchControl.text.isEmpty?const Image(image: AssetImage("assets/images/Group 22.png")):ListView.builder(
                    itemCount: snapshot.data?.results?.length,
                    itemBuilder: (context, index) {
                      List<Results>ListSearch=snapshot.data?.results??[];
                      Results s=ListSearch[index];
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Details.RouteNAME,
                                arguments: s);
                          },
                          child: SearchItem(results: s,));

                  },),
                ) ;

              }),

      //    searchControl.text.isEmpty?Expanded(child: Center(child: Image.asset("assets/images/Group 22.png"))):ListView()
        ],
      ),
    );
  }
}
