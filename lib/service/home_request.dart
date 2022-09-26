import 'dart:convert';

import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/service/config.dart';
import 'package:learn_flutter/service/http_request.dart';

class HomeRequest {
  static Future<List<MSHomeMoviceModelItem>> requestMovieList(int page) async {
    final movieUrl =
        "https://y.szasd2233.me/api/v1/MacTypes/Detail?classtype=&limit=${HomeConfig.pageSize}&page=$page&type=1";
    final res = await HttpRequest.request(movieUrl);
    final list = res["data"]["list"] as List<dynamic>;
    return list.map((e) {
      return MSHomeMoviceModelItem.fromMap(e);
    }).toList();
  }
}
