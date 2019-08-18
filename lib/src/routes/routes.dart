import 'package:flutter/material.dart';
import 'package:prohealth/src/pages/citasmedicas_page.dart';
import 'package:prohealth/src/pages/close_page.dart';
import 'package:prohealth/src/pages/exameneslab_page.dart';
import 'package:prohealth/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {

 return <String, WidgetBuilder> {
    '/' : (BuildContext context) => HomePage(),
    'dates' : (BuildContext context) => CitasMedicasPage(),
    'tests' : (BuildContext context) => ExamenesLabPage(),
    'exit'  : (BuildContext context) =>ClosePage(),
  
  };

}
