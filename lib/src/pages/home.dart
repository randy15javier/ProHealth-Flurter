import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  final opciones = ['Reserva Citas Médicas', 'Reserva Exámenes Médicos', 'Salir'];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProHealth'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();
    
      for (String opt in opciones) {
      
        final tempWidget = ListTile(
          title: Text(opt),
        );

        lista.add(tempWidget);
        lista.add(Divider(
          color: Colors.red,
        ));
      } 

    return lista;

  }

List <Widget> _crearItemsCorta() {
  return opciones.map( ( item) {

    return Column(
      children: <Widget>[
        ListTile(
          title: Text( item ),
          leading: Icon(Icons.assignment),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () { },
        ),
        Divider()
      ],
    );
  }).toList();
}


}