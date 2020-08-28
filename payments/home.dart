import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homepage', style: TextStyle(fontSize: 24),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Text('existing card'),
      ),
    );
  }
}
