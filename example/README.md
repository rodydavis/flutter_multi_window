# example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_multi_window/flutter_multi_window.dart';

void main() => runApp(MyApp());

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_multi_window',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _url = 'https://flutter.dev';
  double _width = 0.5;
  double _height = 0.5;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * _height;
    final width = size.width * _width;
    return Scaffold(
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
                  NewWindow(
                    url: _url,
                    width: width,
                    height: height,
                  )..create();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```