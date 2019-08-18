import 'package:flutter/material.dart';


import 'package:flutter/services.dart';

class ClosePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}