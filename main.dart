import 'package:flutter/material.dart';
import 'dart:html' as html;

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _url = 'https://flutter.dev';
  double _width = 0.5;
  double _height = 0.5;
  @override
  Widget build(BuildContext context) {
    final screen = html.window.screen;
    final height = screen.height * _height;
    final width = screen.width * _width;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    initialValue: _url,
                    onChanged: (val) {
                      _url = val;
                    },
                    decoration: InputDecoration(
                      labelText: "URL",
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Width % = ${width.toStringAsFixed(1)}'),
                  subtitle: Slider(
                    value: _width,
                    onChanged: (val) {
                      if (mounted)
                        setState(() {
                          _width = val;
                        });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Height % = ${height.toStringAsFixed(1)}'),
                  subtitle: Slider(
                    value: _height,
                    onChanged: (val) {
                      if (mounted)
                        setState(() {
                          _height = val;
                        });
                    },
                  ),
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.desktop_windows),
                  label: Text('Create Window'),
                  onPressed: () {
                    _createWindow(_url, Size(height, width));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createWindow(String url, Size size, {Offset offset, String name = ''}) {
    final screen = html.window.screen;
    final height = size.height;
    final width = size.width;
    final sb = StringBuffer();
    final top =
        offset?.dy ?? (screen.height != null ? (screen.height - height) / 2 : 0);
    final left =
        offset?.dx ?? (screen.width != null ? (screen.width - width) / 2 : 0);
    sb.write("height=");
    sb.write(height);
    sb.write(",width=");
    sb.write(width);
    sb.write(",top=");
    sb.write(top);
    sb.write(",left=");
    sb.write(left);
    sb.write(
        ",scrollbars=yes,resizable=yes,toolbar=no,status=no,menu=no, directories=no,titlebar=no,location=no,addressbar=no");
    final settings = sb.toString();
    html.window.open(url, name, settings);
  }
}
