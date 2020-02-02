import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  // String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Input Page' ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
      
    );
  }

  Widget _crearNombre() {

    return TextField(

      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text( 'Letras ${ _nombre.length }' ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        icon: Icon( Icons.account_circle),
        suffixIcon: Icon( Icons.person_outline),
        helperText: 'Solo es el nombre',

      ),
      onChanged: ( valor ) {
        setState(() {
        _nombre = valor;
          
        });
        
      },
    );

  }

  Widget _crearEmail() {

    return TextField(

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        hintText: 'Email de la persona',
        labelText: 'Email',
        icon: Icon( Icons.mail),
        suffixIcon: Icon( Icons.mail_outline),

      ),
      onChanged: ( valor ) {
        setState(() {
        _email = valor;
          
        });
        
      },
    );
  }

  Widget _crearPassword() {

    return TextField(

      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
       
        hintText: 'Password de la persona',
        labelText: 'Password',
        icon: Icon( Icons.vpn_key),
        suffixIcon: Icon( Icons.lock_outline),
        

      ),
      
    );
  }

  Widget _crearFecha( BuildContext context ) {

   return TextField(

      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
       
        hintText: 'Fecha nacimiento',
        labelText: 'Fecha nacimiento',
        icon: Icon( Icons.calendar_today),
        suffixIcon: Icon( Icons.perm_contact_calendar),
        

      ),
      onTap: () {
        FocusScope.of(context).requestFocus( new FocusNode());
        _selectDate( context );
      },
    );
 }

  _selectDate( BuildContext context) async {

   DateTime picked = await showDatePicker(
     context: context,
     initialDate: new DateTime.now(),
     firstDate: new DateTime(1989),
     lastDate: new DateTime(2025),
     locale: Locale('es')
   );

   if ( picked != null) {

     

     setState(() {
        String _fecha = DateFormat('yyyy-MM-dd').format(picked);
        _inputFieldDateController.text = _fecha;
     });
   }

 }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {

      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });

          },
        ),
      ],
    );
    
    
    
  }


  Widget _crearPersona() {

    return ListTile(
      title: Text( 'El nombre es: $_nombre' ),
      subtitle: Text( 'El email es: $_email' ),
      trailing: Text( _opcionSeleccionada ),
    );
  }


}