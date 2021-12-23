import 'package:flutter/material.dart';
import 'package:wolfit_aplication/models/ejercicios_model.dart';
import 'package:wolfit_aplication/services/ejercicios_service.dart';
import 'package:wolfit_aplication/widgets/ejercicios_card.dart';


class EjerciciosWidget extends StatefulWidget {
  const EjerciciosWidget({Key? key}) : super(key: key);

  @override
  _EjerciciosWidgetState createState() => _EjerciciosWidgetState();
}

class _EjerciciosWidgetState extends State<EjerciciosWidget> {

final EjerciciosAPP _ejerciciosservice = EjerciciosAPP();
List<Ejercicios>? _listejercicio;
  @override

  void initState() {
    super.initState();
    _downloadejercicios();
  }
  @override
  Widget build(BuildContext context) {
    return _listejercicio == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()))
        : _listejercicio!.isEmpty
            ? const Center(
                child: SizedBox(
                child: Text("No hay Ejercicios")))
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 14.0),
                
                  child: ListView(
                  children:  _listejercicio!.map((e) => EjerciciosCard(model: e)).toList()));
  }

_downloadejercicios() async {
    _listejercicio = await _ejerciciosservice.getEjercicios();
    if(mounted){
      setState(() {});
    } 
  }

}