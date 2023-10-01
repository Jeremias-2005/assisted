import 'package:flutter/material.dart';

import '../developer/consultasf.dart';

void main() {
  runApp(Profe(
    anio: '',
    section: '',
  ));
}

class Profe extends StatefulWidget {
  String? anio;
  String? section;
   Profe({super.key,required this.anio, required this.section});

  @override
  State<Profe> createState() => _ProfeState();
}

class _ProfeState extends State<Profe> {
  var result;
  List check=[];
  List nie=[];
  List nombre=[];
  @override
  void initState() {
    super.initState();
    getMaterias();
  }
  final List<String> datos = ["Dato 1", "Dato 2", "Dato 3", "Dato 4"];
   Future<void> getMaterias() async {
    result = await getAlumns(widget.anio,widget.section);
    for(var i=0; i<result.length; i++){
      check.add(true);
      var dato=result[i];
      var n=dato["nie"];
      var name=dato["nombre"];
      setState(() {
        nie.add(n);
        nombre.add(name);
      });
    }
   }
  // Definir una lista de datos
  
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 15.00 : screenWidth > 600? 30.00 : 16.00;//para textos normales
    double textSize2 = screenWidth < 340 ? 20.0 : screenWidth >600 ? 40.00 : 20.00;//para titulos
    double textSize3 = screenWidth < 340 ? 15.0 : screenWidth >600 ? 30.00 : 20.00;//para botones
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:const  Color.fromARGB(255, 80, 134, 193),
        appBar: AppBar(
          backgroundColor: const  Color.fromARGB(255, 80, 134, 193),
          leading: MaterialButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back,color: Colors.white,),),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
              //falta hacer responsivo
             const Text("Turno: Vespertino"),
              const Text("Materia: "),
               Text("Año: ${widget.anio}"),
              Text("Sección: ${widget.section}"),
              Padding(padding: EdgeInsets.all(screenSize.width * 0.1)),
              Container(
                width: screenSize.width * 0.95,
                height:  screenSize.height * 0.04,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 2),right: BorderSide(width: 2),left: BorderSide(width: 2)),
                ),
                child: Table(
                  defaultVerticalAlignment:TableCellVerticalAlignment.middle,
                  columnWidths:const {
                    0:FlexColumnWidth(2.0),
                    1:FlexColumnWidth(1),
                    2:FlexColumnWidth(1.6),
                  } ,
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text("Nombre completo")),),
                      TableCell(child: Center(child: Text("Marcar Asistencia")),),
                       TableCell(child: Center(child: Text("Justificación")),)
                    ]
                    
                  )
                ],
                ),
              ),
              Container(
                width: screenSize.width * 0.95,
                height:  screenSize.height * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                ),
                child: ListView.builder(
                  itemCount: nombre.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Crea un botón para cada elemento en la lista de datos
                    return Table(
                      defaultVerticalAlignment:TableCellVerticalAlignment.middle,
                      columnWidths:const {
                    0:FlexColumnWidth(2.0),
                    1:FlexColumnWidth(1),
                    2:FlexColumnWidth(1.6),
                  } ,
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            TableCell(child: Center(child: Text(nombre[index]))),
                            TableCell(child: Checkbox(
                              value: check[index],
                              onChanged: (bool? newvalue) {
                                setState(() {
                                  check[index]= newvalue ?? false;
                                  if(check[index]==false){
                                    print("El estudiante  '${nie[index]}'no asistion ");
                                  }else{
                                    print("El estudiante  '${nie[index]}'si asistio ");
                                  }        
                                }); 
                              },
                            )),
                            TableCell(child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(check[index]==true) 
                                const Text("")
                                else                            
                                Container(
                                  width: screenSize.width * 0.31,
                                  height:  screenSize.height * 0.05,
                                  decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: MaterialButton(onPressed: (){
                                
                                  },
                                  child: Text("Añadir\nJustificacion"),),
                                )
                              ],
                            ))),
                          ]
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(

                child: MaterialButton(onPressed: (){
                      print(check);//check guarda todos los valores  de todos los check box (cuales estan vacios y cuales no)
                      print(nie);//inclute la misma cantidad de valores del check box
                },
                child: Text("Guardar"),),
              )
            ],
          ),
        ),
      ),
    );
  }
}