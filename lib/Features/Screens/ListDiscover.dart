import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Features/Widgets/SearchItem.dart';
import '../../Model/BrowCategory/BrowCat.dart';
import '../../Model/DiscovMovie/DiscoverMovie.dart';
import '../../Model/TopSide/Results.dart';
import '../../Shared/Remote/Api_Manager.dart';

class ListDiscover extends StatefulWidget {
  static const String RouteName = "Listdis";

  const ListDiscover({super.key});

  @override
  State<ListDiscover> createState() => _ListDiscoverState();
}

class _ListDiscoverState extends State<ListDiscover> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.name} History List",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff121312),
        ),
        backgroundColor: const Color(0xff121312),
        body: Column(
          children: [
            FutureBuilder<DiscoverMovie>(
                future: ApiManager.discoverMov(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    );
                  }

                  return Expanded(
                    child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index) {
                          List<Results> L = snapshot.data?.results ?? [];
                          Results res = L[index];
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: res.genreIds!.length,
                            itemBuilder: (context, index) {
                              if (args.id == res.genreIds![index]) {
                                return SearchItem(results:res ,);
                              } else {
                                return const IgnorePointer(
                                  ignoring: true,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}
