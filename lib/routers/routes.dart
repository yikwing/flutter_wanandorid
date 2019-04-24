import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/wxarticle/wxarticle_list_page.dart';

class Routes {
  static Router router;
  static String root = '/';
  static String wxarticle_list_page = '/wxarticle_list_page';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(
      wxarticle_list_page,
      handler: Handler(
        handlerFunc: (context, params) {
          var id = params['id']?.first;
          return WxarticleListPage(
            id: id,
          );
        },
      ),
    );

    Routes.router = router;
  }
}
