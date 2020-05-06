import 'package:flutter/material.dart';
import 'package:flutter_auth_code_textfield/auth_code_textfield.dart';
import 'package:flutter/services.dart';

class BottomLineLoginPage extends StatefulWidget {
  final ValueChanged onSubmited;
  BottomLineLoginPage({Key key, this.onSubmited}) : super(key: key);

  @override
  _BottomLineLoginPageState createState() => _BottomLineLoginPageState();
}

class _BottomLineLoginPageState extends State<BottomLineLoginPage> {
  String _inputText = '';

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scaleWidth = MediaQuery.of(context).size.width / 414;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '验证码已发送至手机：',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '+86 158XXXXXXXX',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '请输入验证码',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(28, 39, 51, 1),
                  ),
                ),
                AuthCodeTextfield(
                  mode: AuthCodeMode.bottomLine,
                  itemWidth: 50,
                  itemHeight: 60,
                  itemSpacing: 35 * scaleWidth,
                  itemBottomLineColor: Color.fromRGBO(229, 231, 233, 1),
                  cursorWidth: 1,
                  cursorHeight: 30,
                  onChanged: (s) {
                    _inputText = s;
                    if (s.toString().length >= 4 && widget.onSubmited != null) {
                      widget.onSubmited(_inputText);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
