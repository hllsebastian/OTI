import 'package:flutter/material.dart';



class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('Cargando informacion')),
      ),
      body: Center(child: CircularProgressIndicator(color: Colors.redAccent))
    );
  }
}
