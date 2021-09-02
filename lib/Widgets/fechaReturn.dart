import 'package:flutter/material.dart';


class FechaReturn extends StatefulWidget {
  const FechaReturn({
    Key? key,
  }) : super(key: key);

  @override
  _FechaReturnState createState() => _FechaReturnState();
}

class _FechaReturnState extends State<FechaReturn> {


  String? _fecha;
  TextEditingController _inputFecha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      //enableInteractiveSelection: false,
      //controller: _inputControllerDate,
      controller: _inputFecha,
      decoration : InputDecoration(
        border    : OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText : 'Fecha de retorno',
        hintText  : 'Ingresar fecha de retorno',
        suffixIcon: Icon(Icons.calendar_today)
      ),
      onTap: (){

         _selectDate(context);
      });
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
