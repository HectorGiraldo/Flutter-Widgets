import 'package:flutter/material.dart';


final _icono = <String, IconData> {

  'add_alert'       : Icons.add_alert,
  'accessibility'   : Icons.accessibility,
  'folder_open'     : Icons.folder_open,
  'donut_large'     : Icons.donut_large,
  'input'           : Icons.input,
  'slideshow'       : Icons.slideshow,
  'list'            : Icons.list
};


Icon getIcon( String nombreIcono ){

  return Icon( _icono[nombreIcono], color: Colors.blue );
}