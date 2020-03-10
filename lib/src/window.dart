import 'dart:convert';

import 'package:flutter/material.dart';

import 'new_window/new_window.dart';

class NewWindow {
  String url;
  double width;
  double height;
  double offsetX;
  double offsetY;
  String name;

  NewWindow({
    @required this.url,
    @required this.width,
    @required this.height,
    this.offsetX,
    this.offsetY,
    this.name = '',
  });

  NewWindow.fromRect({
    @required this.url,
    @required Rect rect,
    this.name = '',
  })  : this.offsetX = rect.left,
        this.offsetY = rect.top,
        width = rect.width,
        height = rect.height;

  void create() => createWindow(this);
  Offset get offset => Offset(this.offsetX, this.offsetY);
  Size get size => Size(this.width, this.height);

  NewWindow copyWith({
    String url,
    double width,
    double height,
    double offsetX,
    double offsetY,
    String name,
  }) {
    return NewWindow(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      offsetX: offsetX ?? this.offsetX,
      offsetY: offsetY ?? this.offsetY,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'width': width,
      'height': height,
      'offsetX': offsetX,
      'offsetY': offsetY,
      'name': name,
    };
  }

  static NewWindow fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NewWindow(
      url: map['url'],
      width: map['width'],
      height: map['height'],
      offsetX: map['offsetX'],
      offsetY: map['offsetY'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static NewWindow fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewWindow(url: $url, width: $width, height: $height, offsetX: $offsetX, offsetY: $offsetY, name: $name)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NewWindow &&
        o.url == url &&
        o.width == width &&
        o.height == height &&
        o.offsetX == offsetX &&
        o.offsetY == offsetY &&
        o.name == name;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        width.hashCode ^
        height.hashCode ^
        offsetX.hashCode ^
        offsetY.hashCode ^
        name.hashCode;
  }
}

void createWindow(NewWindow window) {
  return newWindow(
    window.url,
    window.width,
    window.height,
    dx: window?.offsetX,
    dy: window?.offsetY,
    name: window?.name,
  );
}
