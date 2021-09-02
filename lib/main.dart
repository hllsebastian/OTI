import 'package:flutter/material.dart';
import 'package:prestamo_devolucion/models/form.dart';
import 'package:prestamo_devolucion/providers/form_provider.dart';
import 'package:provider/provider.dart';
import 'package:prestamo_devolucion/services/form_services.dart';


import 'package:prestamo_devolucion/src/pages/routes.dart';
 
void main() => runApp(AppState());
 

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => FormServices()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario',
      initialRoute: 'home',
      routes: {
        'login'         : (_) => LoginPage(),
        'home'          : (_) => HomePage(),
        'formPrestamo'  : (_) => FormPrestamoPage(),
        'CierrePrestamo': (_) => CierrePrestamoPage(),
        'historial'     : (_) => HistorialPage(),

      },  
    );
  }
}