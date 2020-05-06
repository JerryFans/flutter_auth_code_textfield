import 'package:flutter/material.dart';
import 'item_login_page.dart';
import 'bottom_line_login_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarBrightness: Brightness.light);
  SystemChrome.setSystemUIOverlayStyle(style);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
            SizedBox(height:20),
            Container(
              width: 200,
              height: 44,
              child: RaisedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (_) => ItemLoginDemoPage(
                       onSubmited: (s) {
                          _receiveCode = s;
                          setState(() {
                            
                          });
                       },
                     ),
                   ));
                },
                child: Text('item mode demo'),
              ),
            ),
            SizedBox(height:20),
            Container(
              width: 200,
              height: 44,
              child: RaisedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (_) => BottomLineLoginPage(
                       onSubmited: (s) {
                          _receiveCode = s;
                          setState(() {
                            
                          });
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
