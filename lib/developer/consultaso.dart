import 'package:http/http.dart' as http;

import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

Future<dynamic> comprobara(String usuariobd, String contrabd) async {
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/formsub.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return enviar.body;
  }
}

Future<dynamic> asisg(String fecha1) async {
  http.Response enviar = await http.post(
    Uri.parse('https://notas10073.000webhostapp.com/asisg.php'),
    body: <String, dynamic>{
      "fecha": fecha1
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    var resultado = jsonDecode(enviar.body);
    print(resultado);
    return resultado;
  }
}

