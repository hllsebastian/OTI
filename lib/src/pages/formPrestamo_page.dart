import 'package:flutter/material.dart';
import 'package:prestamo_devolucion/models/form.dart';
import 'package:prestamo_devolucion/providers/form_provider.dart';
import 'package:prestamo_devolucion/services/form_services.dart';
import 'package:provider/provider.dart';

class FormPrestamoPage extends StatelessWidget {
  
  const FormPrestamoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        
    //final form = formPrest.formulario;

    return Scaffold(
        appBar: AppBar(
          title: Text('Prestamo y Devolucion'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 60),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            
            
            SavePrestamo()
            
            /* SizedBox(height: 50),
            AreaSolicitante(),
            SizedBox(height: 30),
            FechaPrest(),
            SizedBox(height: 30),
            Observaciones(), */

            /*               Container(
                  padding: EdgeInsets.symmetric(horizontal:40, vertical: 0),
                  margin: EdgeInsets.only(top: 150),
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:40, vertical: 0),
                
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.ac_unit),
                        Icon(Icons.ac_unit),
                      
                    ],),
                  ),
                ) */
          ]),
        ),
        floatingActionButton: _Botones());
  }
}



class SavePrestamo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

  final form = Provider.of<FormServices>(context);
  final saveForm = form.ingresoForm;
  /* final formPrest = Provider.of<FormProvider>(context);
  final saveForm = formPrest.formulario; */

    return Form(
      //key: formPrest.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [

          SizedBox( height: 10 ),

          TextFormField(
            
            decoration: InputDecoration(
              border    : OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText : 'Area Solicitante',
              hintText  : 'Ingrese el area de la empresa',
              suffixIcon: Icon(Icons.business)
            ),

            /* onChanged: (value) => saveForm.area = value,*/

            validator   : ( value ) {  // Control para ingreso de datos
                  if ( value == null || value.length < 1 )
                    return 'El nombre es obligatorio';  
            },                    
          ),
          SizedBox( height: 10 ),

          FechaPrest(),
          SizedBox( height: 10 ),

          TextFormField(
            decoration: InputDecoration(
              border    : OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText : 'Observaciones',
              hintText  : 'Ingrese la observacion',
              suffixIcon: Icon(Icons.format_align_justify)
            ),

            /* onChanged: (value) => saveForm.observacion = value,*/

            validator   : ( value ) {  // Control para ingreso de datos
                  if ( value == null || value.length < 1 )
                    return 'Ingrese alguna descripcion del prestamo';  
            },                     
          ),
          SizedBox( height: 10 ),
        ],
      )
    );
  }
}


                                    // Bontones de guardado y regreso al home
class _Botones extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final formPrest = Provider.of<FormServices>(context);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      FloatingActionButton(
          child: Icon(Icons.arrow_back, size: 40),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          }),
      FloatingActionButton(
          child: Icon(Icons.save, size: 40),
          onPressed: () async{
            await formPrest.createFormulario(formPrest.ingresoForm);
          }),
    ]);
  }
}


                                          // Calendario para guardar fecha
class FechaPrest extends StatefulWidget {
  const FechaPrest({
    Key? key,
  }) : super(key: key);

  @override
  _FechaPrestState createState() => _FechaPrestState();
}

class _FechaPrestState extends State<FechaPrest> {
  String? _fecha;
  TextEditingController _inputFecha = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final form = Provider.of<FormServices>(context);
    final saveForm = form.ingresoForm;

    /* final ingresoForm = Provider.of<FormProvider>(context);
    final saveForm = ingresoForm.formulario; */

    return TextFormField(
        autofocus: false,
        //enableInteractiveSelection: false,
        //controller: _inputControllerDate,
        controller: _inputFecha,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Fecha de prestamo',
            hintText: 'Ingresar fecha de prestamo',
            suffixIcon: Icon(Icons.calendar_today)),
        onTap: () {
          _selectDate(context);
        },

        // onChanged: (value) => saveForm.fechaPrest = value
        validator: (value) {
            if ( value == null || value.length < 1 )
            return 'Seleccione una fecha del calendario';        } 
    );
  }


  _selectDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFecha.text = _fecha!;
      });
    }
  }
}

