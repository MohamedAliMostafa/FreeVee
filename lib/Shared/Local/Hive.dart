import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Hiv extends ChangeNotifier
{



final watchRef=Hive.box("WatchList");
List<Map<String,dynamic>> watchListData=[];
addToLocalDatabaseWatchList(String img,String title,String date,String t)
{
  watchRef.add({
  "image":img,
    "title":title,
    "date":date,
    "Temp":t
  });
  getData();
  notifyListeners();

}
getData()
{
  watchListData= watchRef.keys.map((e){
    final current=watchRef.get(e);
    return {
      "key":e,
    "image":current["image"],
      "title":current["title"],
      "date":current["date"],
      "Temp":current["Temp"],

    };
  }).toList();

 // notifyListeners();
}
deleteData(int? watch_Key)
async {
  await watchRef.delete(watch_Key);
  notifyListeners();
}
deleteAllData()
async {
  await watchRef.clear();
  notifyListeners();
}
}