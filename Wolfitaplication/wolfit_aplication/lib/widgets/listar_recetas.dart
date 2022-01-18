import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wolfit_aplication/pages/home_page.dart';
import 'package:wolfit_aplication/services/receta_service.dart';

// ignore: camel_case_types
class listareceta extends StatefulWidget {
  const listareceta({Key? key}) : super(key: key);

  @override
  _listarecetaState createState() => _listarecetaState();
}

// ignore: camel_case_types
class _listarecetaState extends State<listareceta> {
  int _pasowidget = 0;
  File? _imagenreceta;
  String? _urlimagenreceta;

  final nombre = TextEditingController();
  final ingredientes = TextEditingController();
  final preparacion = TextEditingController();
  final imagen = TextEditingController();
  final FotosService _fotosService = FotosService();

 //lave personal para el formulario
   final List<GlobalKey<FormState>> _listaLlaves = [
    GlobalKey(),
  ];
  List<Step> ruta()=>[
    Step(
      isActive: _pasowidget>= 0,
      title: const Text("Receta"),
      content: Form(
        key: _listaLlaves[0],
        autovalidateMode:AutovalidateMode.always,
        child: receta()))

  ];
  Future _selectImage(ImageSource source) async {
    final imageCamera = await ImagePicker().pickImage(source: source);
    if (imageCamera == null) return;
    final imageTemporary = File(imageCamera.path);
    _imagenreceta = imageTemporary;
    if (_imagenreceta != null) {
      _urlimagenreceta = await _fotosService.uploadImage (_imagenreceta!);
    }
    setState(() {});
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.vertical,
        steps: ruta(),
        currentStep: _pasowidget,
        onStepContinue: () async {
          final pasofinal = _pasowidget == ruta().length - 1;
          if(_listaLlaves[_pasowidget].currentState!.validate()){
            if(pasofinal){
              await _enviaralservidor();
               showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Registro Completado',
                          textAlign: TextAlign.center,
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const [
                              Text(
                                'Exitoso',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              child: const Text(
                                'Aceptar',
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              })
                        ],
                      );
                    });

              }else {
                setState(() =>_pasowidget += 1);
              }
            }
          },
          onStepCancel: _pasowidget == 0
              ? () {
                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                }
              : () {
                  setState(() => _pasowidget -= 1);
                },
    ));
  }

Widget receta() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(children: <Widget>[
            TextFormField(
              controller: nombre,
              decoration: const InputDecoration(
                  labelText: "Nombre  de la Receta", prefixIcon: Icon(Icons.mode_edit_outlined)),
            ),
            TextFormField(
              controller: ingredientes,
              decoration: const InputDecoration(
                  labelText: "Ingredientes", prefixIcon: Icon(Icons.restaurant)),
            ),
            TextFormField(
              controller: preparacion,
              decoration: const InputDecoration(
                  labelText: "Preparación", prefixIcon: Icon(Icons.kitchen)),
    
            ),
             MaterialButton(
              child: const Icon(Icons.camera_alt),
              elevation: 50.0,
              onPressed: () => _selectImage(ImageSource.camera)),
          ]),
        ));
  }
  //enviar datos al servidor
  Future<void> _enviaralservidor() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('recetas');
      await reference.add({
        "nombre": nombre.text,
        "ingredientes": ingredientes.text,
        "preparacion": preparacion.text,
        "imagen":_urlimagenreceta,

      });
    });
  }
}
  




