// Desde aca se hara las peticiones HTTP

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:prestamo_devolucion/models/form.dart';

class FormServices extends ChangeNotifier {
  
  final String _baseUrl = 'prestamodevolucion-default-rtdb.firebaseio.com';
  final List<Formul> form = [];

  late Formul ingresoForm; //  ---->> Para crear nuevo formulario

  bool isLoading = true;
  bool isSaving  = true;

 

  FormServices() {
    this.loadForm();
  }

                          // -->> Peticion HTTP GET (ver los datos)
  Future<List<Formul>> loadForm() async {
    
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'form.json');
    final resp = await http.get(url);

    final Map<String, dynamic> formMap = json.decode(resp.body);

    // El map se pasa a list para poder hacer un listview

    formMap.forEach((key, value) {
      final tempForm = Formul.fromMap(value);
      tempForm.id = key;
      this.form.add(tempForm);
    });

    this.isLoading = false;
    notifyListeners();

    return this.form;
  }


  // Condicion para indicar cuando se va a crear y a actualizar
  /* Future crearUpdateForm( Formul formulario ) async {

    isSaving = true;
    notifyListeners();

    if ( formulario.id == null ) {
      // Es necesario crear
      await this.createformulario( formulario );
    } else {
      // Actualizar
      await this.updateformulario( formulario );
    }

    isSaving = false;
    notifyListeners();

  } */

                                //  ---->>  Peticion PUT para actualizar
   Future<String> updateFormulario( Formul formulario  ) async {

    // Aca se hace la peticion al backend, se accede al endopoint del id del
    // producto 
    final url = Uri.https( _baseUrl, 'form/${ formulario.id }.json');
    // Se envia como ".put" para actualizar y se envia como Json ".toJson" 
    final resp = await http.put( url, body: formulario.toJson() );
    final decodedData = resp.body;

    //Actualizar el listado de productos por el ID
    // se busca el ID del producto (como mapa)  y luego de obtenido se puede
    // actualizar. Asi todo el objeto cambia     
    final index = this.form.indexWhere((element) => element.id == formulario.id );
    this.form[index] = formulario;

    return formulario.id!;

  }

                            //  ---->>  Peticion POST para crear nueva form
  // Para crear nueva form  desde la apliacion, con la creacion automatica
  // del ID 
  Future<String> createFormulario( Formul formulario ) async {

    final url = Uri.https( _baseUrl, 'form.json');
    //"post" Para postear la informacion
    final resp = await http.post( url, body: formulario.toJson() );
    final decodedData = json.decode( resp.body );

    // El decodeData va a asigar el ID al producto
    formulario.id = decodedData['area'];

    this.form.add(formulario);
    

    return formulario.id!;

  }

} // cierre del FormServices


