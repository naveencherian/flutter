import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(new Center(child: new Flavor()));
}

class Flavor extends StatefulWidget {
  @override
  _FlavorState createState() => new _FlavorState();
}

class _FlavorState extends State<Flavor> {
  String _flavor;

  @override
  void initState() {
    super.initState();
    new MethodChannel('flavor').invokeMethod('getFlavor').then((String flavor) {
      setState(() {
        _flavor = flavor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _flavor == null 
      ? new Text('Awaiting flavor...')
      : new Text(_flavor, key: const ValueKey<String>('flavor'));
  }
}
