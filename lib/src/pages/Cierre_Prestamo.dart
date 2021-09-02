import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:prestamo_devolucion/models/form.dart';
import 'package:prestamo_devolucion/src/pages/loading.dart';
import 'package:prestamo_devolucion/services/form_services.dart';

// Para cerrar el formulario y dejarlo como historial
class CierrePrestamoPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
  
    final formServices = Provider.of<FormServices>(context);
    //final lista    = formServices.form.asMap().toString();

    //TODO Loading fullScreen, mientras se tiene la respuesta HTTP
    if (formServices.isLoading) return LoadingPage();

    return Scaffold(
      appBar: AppBar(title: Text('Formularios para cerrar')),

      // IMPORTANTE: el ListView.builder me ayudo a hacer barrido de la lista
      // para luego ingresar cada formulario en un "_CierreForm"
      body: ListView.builder(
        itemCount: formServices.form.length,
        itemBuilder: (context, int index) => Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: _CierreForm(lista: formServices.form[index]), //--->> Vista del form
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back, size: 40),
          onPressed: () => Navigator.pushNamed(context, 'home') 
      ),
    );
  }
}

class _CierreForm extends StatelessWidget {
  

    final Formul lista;

    const _CierreForm({
    Key? key,
    required this.lista,
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
    
    final formServices = Provider.of<FormServices>(context);
    

    //final lista    = formServices.form.asMap().toString();

    //final FormServices peticion;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          TextFormField(
            decoration: InputDecoration(
              labelText: 'ID',
            ),
            // Para ingresar al form el nombre traido del servidor
            initialValue: lista.id,
            // Acá se recibe el cambio que el usuario haga en el form
            onChanged: (value) => lista.area = value,
            // Condicion para controlar el ingreso de un nombre en el form
            validator: (value) {
              if (value == null || value.length < 1)
                return 'El area es obligatorio';
            },
            onTap: (){

            },
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Area Solicitante',
            ),
            // Para ingresar al form el nombre traido del servidor
            initialValue: lista.area,
            // Acá se recibe el cambio que el usuario haga en el form
            onChanged: (value) => lista.area = value,
            // Condicion para controlar el ingreso de un nombre en el form
            validator: (value) {
              if (value == null || value.length < 1)
                return 'El area es obligatorio';
            },
            onTap: (){
            },
          ),



          TextFormField(
             decoration: InputDecoration(
              labelText: 'Fecha de prestamo'
            ),
            // Para ingresar al form el nombre traido del servidor
            initialValue: lista.fechaPrest,
            // Acá se recibe el cambio que el usuario haga en el form
            onChanged: (value) => lista.fechaPrest = value,
            // Condicion para controlar el ingreso de un nombre en el form
            validator: (value) {
              if (value == null || value.length < 1)
                return 'La fecha de prestamo es obligatoria';
            },
          ),

          TextFormField(
             decoration: InputDecoration(
              labelText: 'Fecha de retorno'
            ),
            // Para ingresar al form el nombre traido del servidor
            initialValue: lista.fechaReturn,
            // Acá se recibe el cambio que el usuario haga en el form
            onChanged: (value) => lista.fechaReturn = value,
            // Condicion para controlar el ingreso de un nombre en el form
            validator: (value) {
              if (value == null || value.length < 1)
                return 'La fecha de prestamo es obligatoria';
            },
          ),

          TextFormField(
             decoration: InputDecoration(
              labelText: 'observaciones'
            ),
            // Para ingresar al form el nombre traido del servidor
            initialValue: lista.observacion,
            // Acá se recibe el cambio que el usuario haga en el form
            onChanged: (value) => lista.observacion = value,
            // Condicion para controlar el ingreso de un nombre en el form
            validator: (value) {
              if (value == null || value.length < 1)
                return 'La observaciones es obligatoria';
            },
          ),

          IconButton(  // Aca se definio la funcion para actualizar el formulario
            icon: Icon(Icons.save, color: Colors.deepPurple),
            onPressed: () {
              formServices.updateFormulario(lista);
            },
          )
        ],
      ),
    );
  }
}
