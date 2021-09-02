import 'package:flutter/material.dart';
import 'package:prestamo_devolucion/models/form.dart';


class FormProvider extends ChangeNotifier {

  // Ayudara a conocer el estado del formulario porque ayuda
  // mantener su referencia 
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  

  Formul formulario;

  FormProvider(this.formulario);


  bool isValidForm(){

    return formkey.currentState?.validate() ?? false;


  }

}

