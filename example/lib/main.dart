import 'package:flutter/material.dart';
import 'item_login_page.dart';
import 'bottom_line_login_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _receiveCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Receive code : $_receiveCode'),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 44,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ItemLoginDemoPage(
                          onSubmited: (s) {
                            _receiveCode = s;
                            setState(() {});
                          },
                        ),
                      ));
                },
                child: Text('item mode demo'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 44,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BottomLineLoginPage(
                          onSubmited: (s) {
                            _receiveCode = s;
                            setState(() {});
                          },
                        ),
                      ));
                },
                child: Text('bottom line mode demo'),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
