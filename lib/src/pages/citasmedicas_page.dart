import 'dart:developer';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart'; 
import 'package:flutter/src/material/dropdown.dart';

class CitasMedicasPage extends StatefulWidget {
  CitasMedicasPage({Key key}) : super(key: key);

  _CitasMedicasPageState createState() => _CitasMedicasPageState();
}

class _CitasMedicasPageState extends State<CitasMedicasPage> {
  
  List<String> _clinicas = ['Clinica Profamilia', 'Clínica Inmaculada'];
  
  String _opcionSeleccionada = 'Clinica Profamilia';
  
  List<String> _especialidades = ['Pediatría', 'Dermatología', 'Odontología', 'Neurocirugia'];

  String _optSeleccionada = 'Pediatría';
  
  TextEditingController _inputFieldDateController = new TextEditingController();

  TextEditingController _inputFieldTimeController = new TextEditingController();
  
  String _nombre;

  String _fecha = '';

  String _hora = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva Citas Médicas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearCita(),
          Divider(),
          _crearClinica(),
          Divider(),
          _crearEspecialidad(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearHora(context),
          Divider(),
          Center(
            child: RaisedButton(
              child: Text('Reservar Cita'),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: ()=> _mostrarAlerta(context),
            ),
          )
        ],
      ),
    );
  }
          
            Widget  _crearCita() {
          
              return TextField(
                // autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Nombres del paciente',
                  labelText: 'Nombres',
                  suffixIcon: Icon (Icons.accessibility_new),
                  icon: Icon(Icons.account_circle)
                ),
                onChanged: (valor) {
                  setState(() {
                  
                  _nombre = valor;
                    
                  });
                },
              );
          
            }
          
            List<DropdownMenuItem<String>> getOpciones() {
          
              List<DropdownMenuItem<String>> lista = new List();
          
              _clinicas.forEach( (clinica) {
          
                lista.add(DropdownMenuItem(
                  child: Text(clinica),
                  value: clinica,
                ));
          
              });
          
              return lista;
          
            }
            
            Widget _crearClinica() {
          
              return Row(
                children: <Widget>[
                Icon(Icons.select_all),
                SizedBox(width: 30.0,),
                Expanded(
                  child: DropdownButton(
                  value: _opcionSeleccionada,
                  items: getOpciones(),
                  onChanged: (opt) {
                    setState(() {
                     _opcionSeleccionada = opt; 
                    });
                  },
          
              ),
                )
                ],
              ); 
              
          }

        List<DropdownMenuItem<String>> getOpts() {
          
              List<DropdownMenuItem<String>> lista = new List();
          
              _especialidades.forEach( (especialidad) {
          
                lista.add(DropdownMenuItem(
                  child: Text(especialidad),
                  value: especialidad,
                ));
          
              });
          
              return lista;
          
            }
          
          Widget  _crearEspecialidad() {
            return Row(
      children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),
      Expanded(
        child: DropdownButton(
        value: _optSeleccionada,
        items: getOpts(),
        onChanged: (opt) {
          setState(() {
           _optSeleccionada = opt; 
          });
        },

    ),
      )
      ],
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
        hintText: 'Fecha de cita',
        labelText: 'Fecha de cita',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
      }); 
    }

  }

  Widget _crearHora(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldTimeController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Hora de cita',
        labelText: 'Hora de cita',
        suffixIcon: Icon( Icons.alarm_add ),
        icon: Icon( Icons.access_alarms )
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectHora( context );

      },
    );

  } 

  _selectHora(BuildContext context) async {

    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );

     if ( picked != null ) {
      setState(() {
          _hora = picked.toString();
          _inputFieldTimeController.text = _hora;
      }); 
    }
  }

  void _mostrarAlerta(BuildContext context) {

    showDialog(

      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("¡Cita Reservada!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Su cita médica ha sido reservada con éxito"),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );

      }

    );

  }
 

}