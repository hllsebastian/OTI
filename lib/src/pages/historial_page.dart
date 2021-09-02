import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:prestamo_devolucion/models/form.dart';
import 'package:prestamo_devolucion/src/pages/loading.dart';
import 'package:prestamo_devolucion/services/form_services.dart';

class HistorialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final formServices = Provider.of<FormServices>(context);
    //final lista    = formServices.form.asMap().toString();



    //TODO Loading fullScreen, mientras se tiene la respuesta HTTP
    if (formServices.isLoading) return LoadingPage();

    return Scaffold(
      appBar: AppBar(title: Text('Formularios guardados')),

      // IMPORTANTE: el ListView.builder me ayudo a hacer barrido de la lista
      // para luego ingresar cada formulario en un "_VistaHistorial"
      body: ListView.builder(
        itemCount: formServices.form.length,
        itemBuilder: (context, int index) => Container(
            width: double.infinity,
            padding: EdgeInsets.all(50),
            child: _VistaHistorial(lista: formServices.form[index],)//--->> Vista del form
        ),
      ),
  
  
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back, size: 40),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          }),
    );
  }
}

class _VistaHistorial extends StatelessWidget {

  final Formul lista;

  const _VistaHistorial({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ListTile(title: Text('ID'),  subtitle: Text('${lista.id}')),
          Divider(),

          ListTile(title: Text('Area'), subtitle: Text ('${lista.area}')),
          Divider(),

          ListTile(title: Text('Fecha Prestamo'), subtitle: Text('${lista.fechaPrest}')),
          Divider(),

          ListTile(title: Text('Fecha Devolución'), subtitle: Text('${lista.fechaReturn}')),
          Divider(),
          
          ListTile(title: Text('observacion'),  subtitle: Text('${lista.observacion}')),
        


        ],
      ),
    );
  }
}


 

      
/*      
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Text(
                'area', 
                style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Por si el texto se sale
              ),
             
              Text(
                'fechaPrest', 
                style: TextStyle( fontSize: 15, color: Colors.white ),
              ),
              
            ],
      ), */
