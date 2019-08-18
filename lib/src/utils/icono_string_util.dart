import 'package:flutter/material.dart';

final _icons = <String, IconData> {

  'local_hospital' : Icons.local_hospital,
  'event_note'     : Icons.event_note,
  'close'          : Icons.close,
};





Icon getIcon (String nombreIcono) {

return Icon( _icons[nombreIcono], color: Colors.blue );


}