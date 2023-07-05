import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Model/TopSide/Results.dart';
import 'package:movies/Shared/Local/Hive.dart';
import 'package:provider/provider.dart';

class IconWathcList extends StatefulWidget {
  Results results;
 int? k;

  bool w=false;


  IconWathcList({required this.results,this.k});

  @override
  State<IconWathcList> createState() => _IconWathcListState();
}

class _IconWathcListState extends State<IconWathcList> {


  @override
  Widget build(BuildContext context) {
    var p=Provider.of<Hiv>(context);
    var  list=p.watchListData;
    return InkWell(
      onTap: () {
        setState(() {
          widget.w=!widget.w;
        });

          widget.w == true
              ? p.addToLocalDatabaseWatchList(widget.results.backdropPath ?? "",
              widget.results.originalTitle ?? "",
              widget.results.releaseDate ?? "", widget.results.title ?? "")
              : debugPrint("ds");

    //    widget.w==true? p.addToLocalDatabaseWatchList(widget.results.backdropPath??"", widget.results.originalTitle??"", widget.results.releaseDate??"", widget.results.title??""):debugPrint(list.length as String?);



      },
      child: Container(
        margin: REdgeInsets.only(left: 10,top: 40),
        width: 20.w,
        height: 25.h,
        decoration: BoxDecoration(
            image:DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.w==false?"assets/images/bookmark.png":"assets/images/true.png"))),
      ),
    );
  }
}
