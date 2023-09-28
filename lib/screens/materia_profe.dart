import 'package:flutter/material.dart';

import '../developer/consultasf.dart';
import 'elec_profe.dart';

void main() {
  runApp(Elec_materia(
    c_profe: '',
  ));
}


class Elec_materia extends StatefulWidget {
  String c_profe;
  Elec_materia({super.key,required this.c_profe});

  @override
  State<Elec_materia> createState() => _Elec_materiaState();
}

// ignore: camel_case_types
class _Elec_materiaState extends State<Elec_materia> {
  var result;
  List cod=[];
  List materias=[];
  // Definir una lista de datos
 
  @override
  void initState() {
    super.initState();
    getMaterias();
  }
  Future<void> getMaterias() async {
     result = await getmateria(widget.c_profe);
     for(var i=0; i<result.length;i++){
      var dato=result[i];
      var codigo=dato["c_materia"];
      var materia=dato["nombre_m"];
      setState(() {  
        cod.add(codigo);
        materias.add(materia);
      });

     }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 30.00 : 16.00;
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >600 ? 40.00 : 20.00;
    double textSize3 = screenWidth < 340 ? 15.0 : screenWidth >600 ? 30.00 : 17.00;//para botones
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:const  Color.fromARGB(255, 80, 134, 193),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Selección de materia",style: TextStyle(color: Colors.white,fontSize:textSize2,fontStyle: FontStyle.italic),),
              const Padding(padding: EdgeInsets.all(20)),
              Container(
                width: screenSize.width * 0.9, // Utiliza el 80% del ancho de la pantalla
                height: screenSize.height * 0.3, // Utiliza el 30% de la altura de la pantalla
                decoration: BoxDecoration(
                  color:const  Color.fromARGB(255, 74, 125, 180),
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 37, 35, 35),
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )  
                                  ],
                ),
                child: ListView.builder(
                    itemCount: materias.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Crea un botón para cada elemento en la lista de datos
                      return Column(
                        children: [
                          ListTile(
                            title: Text(materias[index],style: TextStyle(fontSize: textSize ),),
                            trailing: MaterialButton(     
                              onPressed: () {
                                // Cuando se presiona el botón, identifica el dato correspondiente
                                String datoSeleccionado = materias[index];
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ElecProfe(cod: widget.c_profe,materia: datoSeleccionado,)),
                                );
                                print('Se presionó el botón para $datoSeleccionado');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 62, 104, 150)
                                ),
                                width: screenSize.width * 0.25,
                                height: screenSize.height * 0.035,
                                child: Center(child: Text('Continuar',style: TextStyle(fontSize:textSize3 ),))),
                            ),
                          ),
                          Container(//cambiar
                            width: screenSize.width * 0.8,
                            height: 2,
                            color: Colors.black,
                          )
                        ],
                      );
                    },
                  ),
              ),
              const Padding(padding: EdgeInsets.all(20)),//modificar
              MaterialButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: Container(
                width: screenSize.width * 0.25,
                height: screenSize.height * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 64, 108, 158),
                  
                  ),
                child:  Center(
                  child: Text("Regresar",style: TextStyle(fontSize: textSize3))),
              ),)
            ],
          ),
        ),
        ),
      
    );
  }
}