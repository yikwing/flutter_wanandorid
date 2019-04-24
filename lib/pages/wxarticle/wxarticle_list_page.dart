import 'package:flutter/material.dart';

class WxarticleListPage extends StatefulWidget {
  final String id;

  WxarticleListPage({Key key, this.id}) : super(key: key);

  _WxarticleListPageState createState() => _WxarticleListPageState();
}

class _WxarticleListPageState extends State<WxarticleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sm鸡儿'),
      ),
      body: Center(
        child: Text('==' + widget.id),
      ),
    );
  }
}
