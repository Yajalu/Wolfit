import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wolfit_aplication/models/ejercicios_model.dart';

class EjerciciosAPP{
    EjerciciosAPP();
    final String  _rootUrl = 'https://wolfit-9548f.web.app/api/ejercicio';
    
    Future<List<Ejercicios>> getEjercicios() async {
        List<Ejercicios> resultEjercicios = [];
            try{
                var url = Uri.parse(_rootUrl);
                final responseList = await http.get(url);
                List<dynamic> listEjercicio = json.decode(responseList.body);
                for (var item in listEjercicio){
        
            final ejercicios = Ejercicios.fromJson(item);
            resultEjercicios.add(ejercicios);
         
        }

            }catch(ex){
                //print (ex);
                 return resultEjercicios;
            }
        return resultEjercicios;
    }

}