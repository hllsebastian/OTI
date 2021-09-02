import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prestamo_devolucion/models/form.dart';
import 'package:provider/provider.dart';
import 'package:prestamo_devolucion/services/form_services.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final formPrest = Provider.of<FormServices>(context);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('OTI')
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Container(

                margin: EdgeInsets.only(left: 30),              
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Text('Organizacion y Trazabilidad de la Información', 
                            style: TextStyle(height: 10, fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
        
            Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
             /*  Container (
                color: Colors.green,
                margin: EdgeInsets.only(bottom: 40),
                child: Text('Organizacion y Trazabilidad de la Información'),
              ), */
        
                                      // INGRESO NUEVO FORMULARIO
              Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  title: Text('Formulario de Prestamo y Devolucion'),
                  subtitle: Text('Elija esta opcion para ingresar nuevo formulario'),
                  onTap: () {
        
        
                    Navigator.pushNamed(context, 'formPrestamo');
        
                    formPrest.ingresoForm = new  Formul (
                      area: '', 
                      fechaPrest: '',
                      observacion: '',
                    );
        
                  },
                ),
              ),
              Divider(),
                                      // ACTUALIZAR FORMULARIO
              Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  title: Text('Cierre de Prestamo y Devolucion'),
                  subtitle: Text('Acá cerraras el formulario que ingresaste antes'),
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'CierrePrestamo');
                  },
                ),
              ),
              Divider(),
        
                                      // HISTORIAL DE FORMULARIO
              Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: Text('Historial'),
                    subtitle: Text('Donde podras ver todos los formularios ingresados'),
                    onTap: () {
                      Navigator.popAndPushNamed(context, 'historial');
                    }),
              ),
            ],
          ),


          ],

         
        ),
      ),
    );
  }
}
