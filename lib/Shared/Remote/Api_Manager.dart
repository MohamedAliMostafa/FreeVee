import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:movies/Features/Screens/Details.dart';
import 'package:movies/Model/Latest/Latest.dart';
import 'package:movies/Model/TopRated/TopRated.dart';
import 'package:movies/Model/SeachMovie/SearchMovie.dart';
import 'package:movies/Model/TopSide/TopSideSection.dart';
import 'package:movies/Tabs/Search.dart';

import '../../Core/Api/EndPoints.dart';
import '../../Core/Constants/const.dart';
import '../../Model/BrowCategory/BrowCat.dart';
import '../../Model/DetailsModel/DetailsModel.dart';
import '../../Model/DiscovMovie/DiscoverMovie.dart';
import '../../Model/Similar/Similar.dart';

class ApiManager {
  static Future<TopSideSection> getPopularTopSide() async {
    Uri Url = Uri.https(baseUrl, endPointPopular, {"api_key": Api_key});
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      TopSideSection topSideSection = TopSideSection.fromJson(body);

      return topSideSection;
    } else {
      throw Exception("Falid to load");
    }
  }

  static List<Latest> L = [];

  static Future<Latest> getLatest() async {
    Uri url = Uri.https(baseUrl, endpointLatest, {"api_key": Api_key});
    Response response = await get(url);
    var body = jsonDecode(response.body);
    Latest latest = Latest.fromJson(body);
    if (latest.posterPath == null) {
      latest.posterPath ==
          "https://image.tmdb.org/t/p/original" +
              "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg";
    }
    L.add(latest);
    return latest;
  }

  static Future<TopRated> getTopRated() async {
    Uri url = Uri.https(baseUrl, endpointTopRated, {"api_key": Api_key});
    Response response = await get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      TopRated topRated = TopRated.fromJson(body);

      return topRated;
    } else {
      throw Exception("Falid to load");
    }
  }

  static Future<SearchMovie> searchMov(String title) async {
    Uri Url = Uri.https(
        baseUrl, endpointSearch, {"api_key": Api_key, "query": title});
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      SearchMovie searchMovie = SearchMovie.fromJson(body);
      return searchMovie;
    } else {
      throw Exception("Falid to load");
    }
  }

  static Future<BrowCat> catBrowser() async {
    Uri Url = Uri.https(baseUrl, endpointCatBrowser, {
      "api_key": Api_key,
    });
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      BrowCat browCat = BrowCat.fromJson(body);
      return browCat;
    } else {
      throw Exception("Falid to load");
    }
  }

  static Future<DiscoverMovie> discoverMov() async {
    Uri Url = Uri.https(baseUrl, endpointDiscover, {
      "api_key": Api_key,
    });
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      DiscoverMovie discoverMovie = DiscoverMovie.fromJson(body);
      return discoverMovie;
    } else {
      throw Exception("Falid to load");
    }
  }

  static Future<DetailsModel> getDetails(int Mov_id) async {
    Uri Url = Uri.https(baseUrl, "/3/movie/${Mov_id}", {
      "api_key": Api_key,
    });
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      DetailsModel Detailsm = DetailsModel.fromJson(body);
      return Detailsm;
    } else {
      throw Exception("Falid to load");
    }
  }

  static Future<Similar> getSimilar(int Mov_id) async {
    Uri Url = Uri.http(baseUrl , "/3/movie/${Mov_id}/similar", {
      "api_key": Api_key,
    });
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Similar similar = Similar.fromJson(body);
      return similar;
    } else {
      throw Exception("Falid to load");
    }
  }
}
