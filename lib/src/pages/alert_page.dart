import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }



  void _mostrarAlerta( BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ( context ) {

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('este es el contenido de la tarjeta de alerta'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}