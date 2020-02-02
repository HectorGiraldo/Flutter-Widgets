import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 150.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Slider Page' ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            _crearSwicth(),
            Expanded(child: _crearImagen())
          ],
        ),
      )
      
    );
  }

  Widget _crearSlider() {

    return Slider(
      value: _valorSlider,
      activeColor: Colors.indigoAccent,
      label: 'tamaño de la imagen',
      min: 100.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : ( valor ) {
        setState(() {
          _valorSlider = valor; 
        });
      },
    );
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://st-listas.20minutos.es/images/2014-04/379521/4391953_640px.jpg?1457204927'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }


  Widget _crearCheck() {

    return CheckboxListTile(
      title: Text( 'Bloquear Slider' ),
      value: _bloquearCheck ,
      onChanged: ( valor ) {
        setState(() {

          _bloquearCheck = valor;

        });
      },

    );
  }

  Widget _crearSwicth() {

    return SwitchListTile(
      title: Text( 'Bloquear Slider' ),
      value: _bloquearCheck ,
      onChanged: ( valor ) {
        setState(() {

          _bloquearCheck = valor;

        });
      },

    );

  }


}