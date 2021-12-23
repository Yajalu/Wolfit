import 'package:flutter/material.dart';
import 'package:wolfit_aplication/models/ejercicios_model.dart';

class EjerciciosCard extends StatelessWidget {
  const EjerciciosCard({Key? key, required this.model}) : super(key: key);
  final Ejercicios model;
  @override
  Widget build(BuildContext context) {
    final url = model.fieldsProto?.imagenEjercicio!.stringValue;
    return SizedBox(
      height: 60,
      child: Card(
                   elevation: 7.0,
                        child: ListTile(
              
                            leading: CircleAvatar(backgroundImage: NetworkImage(url.toString())),
                            title: Text(model.fieldsProto!.nombreEjemplo!.stringValue.toString(), style: Theme.of(context).textTheme.headline6),
                            //subtitle: Text(model.fieldsProto!.descripcionEjercicio!.stringValue.toString(), style: Theme.of(context).textTheme.subtitle2),
                            trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                    ),
                      ),
    );
  }
}