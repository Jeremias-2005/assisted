import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Consultass(fecha1: '',),
    
  ));
}

class Consultass extends StatefulWidget {
  final String fecha1;
  const Consultass({super.key, required this.fecha1});

  @override
  State<Consultass> createState() => _ConsultassState();
}

class _ConsultassState extends State<Consultass> {
  List<String> nombre= [];
  // ignore: prefer_typing_uninitialized_variables
  var reslt;
  int asistencia = 0;

  @override
void initState(){
  super.initState();
  (() async{
    reslt = await asisg(widget.fecha1);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nie"]);


  // ignore: non_constant_identifier_names
          var nom_tem = dato["nie"];
asistencia = asistencia+1;

         

setState(() {
  // Actualizar las listas con los datos obtenidos
  nombre.add(nom_tem);
 


});
  }
    }
  })();
}

  @override
  Widget build(BuildContext context) {
  final now = DateTime.now();
  String fecha ="${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 134, 193),
            body: SingleChildScrollView(
              child: Column(
                children:   [
                  const Center(child: 
                   SizedBox(
                    height: 200,  
                    width: 400,
                  child: 
                   Image(image: AssetImage('assets/asis.png'))
                   )
                   ),

            Container(
            width: 300, // Ancho del cuadro gris
            height: 250, // Alto del cuadro gris
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               color: Colors.grey, // Color de fondo gris
            ),
            child:   Center(
              child: Column(
                children:  [
                  const Text('ASISTENCIA',style:  TextStyle(
                    fontSize: 40, color: Colors.white)),
                    const Text('GENNERAL',style:  TextStyle(
                    fontSize: 40, color: Colors.white)),

                    const SizedBox(
                      height: 10,
                    ),

                   Text(fecha,style:  const TextStyle(
                    fontSize: 40, color: Colors.white)),
                    Text(
                '$asistencia',
                style: const TextStyle(fontSize: 40),
              ),


                ],
              ),
              ),
              ),

              


                ],
              ),
            ),
            );
}
}