import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_code_textfield/auth_code_textfield.dart';

class ItemLoginDemoPage extends StatefulWidget {
  final ValueChanged? onSubmited;
  ItemLoginDemoPage({Key? key, this.onSubmited}) : super(key: key);

  @override
  _ItemLoginDemoPageState createState() => _ItemLoginDemoPageState();
}

class _ItemLoginDemoPageState extends State<ItemLoginDemoPage> {
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    double scaleWidth = MediaQuery.of(context).size.width / 414;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 79, 95, 1),
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(87, 79, 95, 1),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '输入验证码',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(
                    text: '已发送4位验证码至',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' +86 158XXXXXXXX',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(168, 162, 172, 1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                AuthCodeTextfield(
                  mode: AuthCodeMode.singleItem,
                  itemWidth: 50,
                  itemHeight: 50,
                  itemSpacing: 35 * scaleWidth,
                  itemBackgroundColor: Color.fromRGBO(120, 114, 127, 1),
                  textColor: Colors.white,
                  cursorColor: Color.fromRGBO(94, 178, 138, 1),
                  onChanged: (s) {
                    setState(() {
                      _inputText = s;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 50 * 4 + (35 * scaleWidth * 3),
                  height: 44,
                  child: CupertinoButton(
                    disabledColor: Color.fromRGBO(54, 127, 105, 1),
                    color: Color.fromRGBO(33, 191, 125, 1),
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    onPressed: _inputText.length >= 4
                        ? () {
                            if (widget.onSubmited != null) {
                              widget.onSubmited?.call(_inputText);
                            }
                            Navigator.pop(context);
                          }
                        : null,
                    child: Text(
                      '确定',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
