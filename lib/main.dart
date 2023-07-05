import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/Features/Screens/Details.dart';
import 'package:movies/Features/Screens/ListDiscover.dart';
import 'package:movies/Features/Screens/Splash.dart';
import 'package:movies/Layout/HomeLayout.dart';
import 'package:movies/Shared/Local/Hive.dart';
import 'package:provider/provider.dart';
import 'Core/Observer.dart';



Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox("WatchList");
  runApp( ChangeNotifierProvider(
      create: (context) => Hiv(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
designSize: const Size(412,870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Splash.routeName,
          routes: {
            HomeLayout.RouteName:(context)=>HomeLayout(),
            Splash.routeName:(context)=>Splash(),
            ListDiscover.RouteName:(context)=>ListDiscover(),
            Details.RouteNAME:(context)=>Details()
            // TopSide.RouteName:(context)=>TopSide(),
          },
        );
      },

    );
  }
}