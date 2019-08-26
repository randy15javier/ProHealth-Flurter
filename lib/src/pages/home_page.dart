import 'package:flutter/material.dart';
import 'package:prohealth/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProHealth'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://img.vixdata.io/pd/jpg-large/es/sites/default/files/r/rip-stan-lee.jpg'),
              radius: 25.0,
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black38
            ),
          ),
        ],
      ),
      body: _lista(),
      drawer: Drawer(
        child: ListView(
          // Importante: elimina cualquier padding del ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
                // Luego cierra el drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // // Actualiza el estado de la aplicación
                // ...
                // Luego cierra el drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _lista() {

    // menuProvider.cargarData()

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        
        return ListView(
          children: _listaItems( snapshot.data, context),
    ); 
      },
    );

  }

  List<Widget>_listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {

      final widgetTemp = ListTile(
        title: Text(opt ['texto']),
        leading: Icon( Icons.assignment, color: Colors.lightBlue,),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.pink, ),
        onTap: () {

          
          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider(color: Colors.red));
    });

  return opciones;

  }
}