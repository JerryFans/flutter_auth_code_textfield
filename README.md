# flutter_auth_code_textfield

A custom auth code textfield widget.

一个Flutter自定义的验证码Widget,纯Flutter代码，支持安卓，iOS.

## Useage

Mode: singleItem , like Keep 

Item模式，如Keep的风格。

```
AuthCodeTextfield(
                  mode: AuthCodeMode.singleItem,
                  itemWidth: 50,
                  itemHeight: 50,
                  itemSpacing: 35 * scaleWidth,
                  itemBackgroundColor: Color.fromRGBO(120, 114, 127, 1),
                  textColor: Colors.white,
                  cursorColor: Color.fromRGBO(94,178,138,1),
                  onChanged: (s) {
                    setState(() {
                      _inputText = s;
                    });
                  },
                ),
```


iOS            |  Android
:-------------------------:|:-------------------------:
![](http://image.jerryfans.com/mode1.png)  |  ![](http://image.jerryfans.com/mode3.png)

Mode: bottomLine , like DingDing 

bottomLine模式，如钉钉的风格。

```
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
```

iOS            |  Android
:-------------------------:|:-------------------------:
![](http://image.jerryfans.com/mode2.png)  |  ![](http://image.jerryfans.com/mode5.png)



## Getting Started

Add this to your package's pubspec.yaml file:

dependencies:
  auth_code_textfield: ^0.0.2

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
