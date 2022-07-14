import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

enum AuthCodeLength {
  four,
  six,
  eight,
}

enum AuthCodeMode {
  singleItem,
  bottomLine,
}

class AuthCodeTextfield extends StatefulWidget {
  final AuthCodeLength length;
  final AuthCodeMode mode;
  final double itemWidth;
  final double itemHeight;
  final double itemSpacing;
  final double itemBorderRadius;
  final double itemBottomLineWidth;
  final Color itemBackgroundColor;
  final Color itemBottomLineColor;
  final double cursorWidth; //光标宽，如果宽>高，会是一个水平的光标，如果宽<高，就是常规竖直的光标
  final double cursorHeight; //光标高
  final double? cursorBottomOffset; //cursor bottom offset, if nil default is center
  final Color cursorColor;
  final Color textColor;
  final double fontSize;
  final double borderWidth;
  final Color borderColor;
  final ValueChanged? onChanged;

  AuthCodeTextfield(
      {Key? key,
      this.length = AuthCodeLength.four,
      this.mode = AuthCodeMode.singleItem,
      this.itemWidth = 50.0,
      this.itemHeight = 50.0,
      this.itemSpacing = 1.0,
      this.itemBorderRadius = 4.0,
      this.itemBottomLineWidth = 1.0,
      this.itemBackgroundColor = Colors.transparent,
      this.itemBottomLineColor = Colors.blueGrey,
      this.cursorWidth = 20.0,
      this.cursorHeight = 2.0,
      this.cursorColor = Colors.blue,
      this.textColor = Colors.black,
      this.fontSize = 25,
      this.borderWidth = 0.0,
      this.borderColor = Colors.grey,
      this.onChanged, 
      this.cursorBottomOffset})
      : super(key: key);

  @override
  _AuthCodeTextfieldState createState() => _AuthCodeTextfieldState();
}

class _AuthCodeTextfieldState extends State<AuthCodeTextfield> {
  String inputText = '';
  FocusNode _currentFocus = FocusNode();
  bool _visibleCursor = false;
  Timer? _timer;

  List<Widget> getTextListWidget() {
    List<Widget> list = [];
    for (int i = 0; i < inputText.length; i++) {
      var s = inputText[i];
      if (i != 0) {
        list.add(
          SizedBox(
            width: widget.itemSpacing,
          ),
        );
      }
      list.add(
        Container(
          alignment: Alignment.center,
          width: widget.itemWidth,
          height: widget.itemHeight,
          child: Text(
            s,
            style:
                TextStyle(fontSize: widget.fontSize, color: widget.textColor),
          ),
        ),
      );
    }
    return list;
  }

  List<Widget> getItemListWidget() {
    List<Widget> list = [];
    for (int i = 0; i < getNumLenth(); i++) {
      if (i != 0) {
        list.add(
          SizedBox(
            width: widget.itemSpacing,
          ),
        );
      }
      list.add(
        Container(
          decoration: BoxDecoration(
            color: widget.itemBackgroundColor,
            borderRadius: widget.mode == AuthCodeMode.singleItem
                ? BorderRadius.circular(widget.itemBorderRadius)
                : null,
            border: widget.mode == AuthCodeMode.bottomLine
                ? Border(
                    bottom: BorderSide(
                        color: widget.itemBottomLineColor,
                        width: widget.itemBottomLineWidth),
                  )
                : (widget.borderWidth > 0
                    ? Border(
                        bottom: BorderSide(
                            color: widget.borderColor,
                            width: widget.borderWidth),
                        top: BorderSide(
                            color: widget.borderColor,
                            width: widget.borderWidth),
                        left: BorderSide(
                            color: widget.borderColor,
                            width: widget.borderWidth),
                        right: BorderSide(
                            color: widget.borderColor,
                            width: widget.borderWidth),
                      )
                    : null),
          ),
          alignment: Alignment.center,
          width: widget.itemWidth,
          height: widget.itemHeight,
        ),
      );
    }
    return list;
  }

  int getNumLenth() {
    int length = 4;
    switch (widget.length) {
      case AuthCodeLength.four:
        length = 4;
        break;
      case AuthCodeLength.six:
        length = 6;
        break;
      case AuthCodeLength.eight:
        length = 8;
        break;
    }
    return length;
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 650), (Timer timer) {
      _visibleCursor = !_visibleCursor;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mainWidth = widget.itemWidth * getNumLenth() +
        widget.itemSpacing * (getNumLenth() - 1);
    double cursorPaddingLeft = (widget.itemWidth - widget.cursorWidth) / 2 +
        (inputText.length * (widget.itemWidth + widget.itemSpacing));
    return Container(
      alignment: Alignment.center,
      width: mainWidth,
      height: widget.itemHeight,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getItemListWidget(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getTextListWidget(),
          ),
          Center(
            child: TextField(
              enableInteractiveSelection: false,
              autofocus: true,
              focusNode: _currentFocus,
              showCursor: false,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(getNumLenth())
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              maxLength: getNumLenth(),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.transparent,
              ),
              onChanged: (s) {
                widget.onChanged?.call(s);
                setState(() {
                  inputText = s;
                });
              },
            ),
          ),
          Positioned(
            bottom: widget.cursorBottomOffset,
            child: Visibility(
              visible: _visibleCursor,
              child: Padding(
                padding: EdgeInsets.only(left: cursorPaddingLeft),
                child: Container(
                  width: widget.cursorWidth,
                  height: widget.cursorHeight,
                  decoration: BoxDecoration(
                    color: widget.cursorColor,
                    borderRadius: BorderRadius.circular(widget.cursorWidth / 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
