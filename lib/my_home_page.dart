import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/wxarticle/chapters_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            print('点击头像');
          },
          child: Container(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://i.loli.net/2019/02/16/5c67ca84d2306.jpeg'),
            ),
          ),
        ),
        title: TabBar(
          tabs: <Widget>[
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
          ],
          controller: _tabController,
          labelPadding: EdgeInsets.all(12.0),
          indicatorSize: TabBarIndicatorSize.label,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('object');
            },
          )
        ],
      ),
      body: TabBarView(
        children: <Widget>[
          ChapterPage(),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
        controller: _tabController,
      ),
    );
  }
}
