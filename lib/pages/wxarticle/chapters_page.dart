import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/project_config.dart';
import 'package:flutter_wanandroid/model/wxarticle/chapters.dart';
import 'package:flutter_wanandroid/okhttp_util.dart';
import 'package:flutter_wanandroid/pages/wxarticle/wxarticle_list_page.dart';
import 'package:flutter_wanandroid/routers/routes.dart';

class ChapterPage extends StatefulWidget {
  ChapterPage({Key key}) : super(key: key);

  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  var chapterBean = List<Data>();

  @override
  void initState() {
    super.initState();
    OkHttpUtil.get(Config.baseUrl + "wxarticle/chapters/json", (data) {
      setState(() {
        chapterBean = ChapterBean.fromJson(data).data;
      });
    });
  }

  _gotoWxList(context, index) {
    Routes.router.navigateTo(
      context,
      '${Routes.wxarticle_list_page}?id=${chapterBean[index].id}',
      transition: TransitionType.fadeIn,
    );

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => WxarticleListPage(
    //           id: '123',
    //         ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Text(chapterBean[index].name),
            onTap: () {
              _gotoWxList(context, index);
            },
          );
        },
        itemCount: chapterBean.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
