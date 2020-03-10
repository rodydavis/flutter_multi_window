[![Buy Me A Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffee-yellow.svg)](https://www.buymeacoffee.com/rodydavis)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WSH3GVC49GNNJ)
[![Pub](https://img.shields.io/pub/v/flutter_multi_window.svg?style=popout)](https://pub.dartlang.org/packages/flutter_multi_window)

# flutter_multi_window

A Flutter project to create new windows on supported platforms.

Online Demo: https://rodydavis.github.io/flutter_multi_window/


| Platform 	| Supported? 	|
|----------	|------------	|
| Web      	| ✅          	|
| MacOS    	| ❎          	|
| Windows  	| ❎          	|
| Linux    	| ❎          	|
| Android  	| ❎          	|
| iOS      	| ❎          	|


## Getting Started

```dart
final window = NewWindow(
  url: 'https://flutter.dev',
  width: 400,
  height: 400,
);

window.create(); // Show the window
```