import 'dart:html' as html;

void newWindow(
  String url,
  double width,
  double height, {
  String name = '',
  double dx,
  double dy,
}) {
  final screen = html.window.screen;
  double top = 0;
  if (dy != null) {
    top = dy;
  } else if (screen.height != null) {
    top = (screen.height - height) / 2;
  }
  double left = 0;
  if (dx != null) {
    left = dx;
  } else if (screen.width != null) {
    left = (screen.width - width) / 2;
  }
  final sb = StringBuffer();
  sb.write("height=");
  sb.write(height);
  sb.write(",width=");
  sb.write(width);
  sb.write(",top=");
  sb.write(top);
  sb.write(",left=");
  sb.write(left);
  sb.write(",scrollbars=yes,resizable=yes,toolbar=no,status=no,menu=no,");
  sb.write("directories=no,titlebar=no,location=no,addressbar=no");
  final settings = sb.toString();
  html.window.open(url, name, settings);
}
