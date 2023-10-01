import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:collection';
// ignore: unused_import
import 'dart:io';
Future<dynamic> comprobarProfe(String usuario, String contra) async {
  print(usuario);
  print(contra);
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/formprofe.php'),
    body: <String, dynamic>{
      "usuario": usuario,
      "contra": contra,
    },
  );
   var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
  }catch(e){
    return "Error";
  }
}
//funcion para obtener materias
Future<dynamic> getmateria(var cod_c) async {
  print(cod_c);
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/getmateria.php'),
    body: <String, dynamic>{
      "cod_c": cod_c,
    },
  );
   var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
  }
  catch(e){
    return "Error";
  }
}

//funcion para obtener años y secciones
Future<dynamic> getG(var cod_c) async {
  print(cod_c);
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/getG.php'),
    body: <String, dynamic>{
      "cod_c": cod_c,
    },
  );
  print(enviar.body);
   var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
}

Future<dynamic> getS(var cod_c) async {
  print(cod_c);
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/getS.php'),
    body: <String, dynamic>{
      "cod_c": cod_c,
    },
  );
  print(enviar.body);
   var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
}

Future<dynamic> getAlumns(var anio, var seccion) async {
  print(anio);
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/extract_Alumn.php'),
    body: <String, dynamic>{
      "anio": anio,
      "section":seccion,
    },
  );
   var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
}