import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../developer/consultasf.dart';

void main() {
  runApp(Profe(
    anio: '',
    section: '',
    turno: '',
    materia: '',
    cod: '',
  ));
}

// ignore: must_be_immutable
class Profe extends StatefulWidget {
  String? anio;
  String? section;
  String? turno;
  String? materia;
  String cod;
  Profe(
      {super.key,
      required this.anio,
      required this.section,
      required this.turno,
      required this.materia,
      required this.cod});

  @override
  State<Profe> createState() => _ProfeState();
}

class _ProfeState extends State<Profe> {
  var result;
  bool isLoading = false;
  bool isLoading2=true;
  String info="";
  String name="";
  double _progress = 0.0;
  double porc=0.0;
  List check = [];
  List nie = [];
  List justi = [];
  List nombre = [];
  @override
  void initState() {
    super.initState();
    getMaterias();
  }

  final List<String> datos = ["Dato 1", "Dato 2", "Dato 3", "Dato 4"];
  Future<void> getMaterias() async {
    result = await getAlumns(widget.anio, widget.section);
    if(result!="Error"){
    for (var i = 0; i < result.length; i++) {
      check.add(true);
      justi.add("N");
      var dato = result[i];
      var n = dato["nie"];
      var name = dato["nombre"];
      setState(() {
        isLoading2=false;
        nie.add(n);
        nombre.add(name);
      });
    }
  }else{
    isLoading2=false;
    info="Error";
  }
  }
  // Definir una lista de datos

  @override
  Widget build(BuildContext context) {
    var nsection;
    if (widget.section == "1") {
      nsection = "A";
    } else if (widget.section == "2") {
      nsection = "E";
    } else if (widget.section == "3") {
      nsection = "K";
    } else if (widget.section == "4") {
      nsection = "G";
    } else if (widget.section == "5") {
      nsection = "D";
    } else if (widget.section == "6") {
      nsection = "O";
    } else if (widget.section == "7") {
      nsection = "L";
    } else if (widget.section == "8") {
      nsection = "M";
    } else if (widget.section == "9") {
      nsection = "N";
    } else if (widget.section == "10") {
      nsection = "F";
    } else if (widget.section == "11") {
      nsection = "H ";
    }
    var turno;
    if (widget.turno == "1") {
      turno = "Matutino";
    } else {
      turno = "Vespertino";
    }
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340? 15.00 : screenWidth > 600 ? 30.00: 16.00; //para textos normales
    double textSize2 = screenWidth < 340? 20.0 : screenWidth > 600 ? 40.00 : 13.00; //para titulos
    double textSize3 = screenWidth < 340? 15.0: screenWidth > 600 ? 30.00 : 20.00; //para botones
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 80, 134, 193),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 80, 134, 193),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const  Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [  
                Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
                //falta hacer responsivo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Turno: ${turno}",style: TextStyle(fontSize: textSize)),
                    Text("Sección: '${nsection}'",style: TextStyle(fontSize: textSize)),
                    Text("Año: ${widget.anio}°",style: TextStyle(fontSize: textSize)),
                  ],
                ),
                Container(
                  width: screenSize.width*0.9,
                  height: 2,
                  color: Colors.black,
                ),
                Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
                Text("Materia: ${widget.materia}",textAlign: TextAlign.center,style: TextStyle(fontSize: textSize),), 
                Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
                 isLoading2?
                    Column(
                      children: const [
                         FittedBox(
                          fit: BoxFit.scaleDown,
                          child:CircularProgressIndicator(
                            color: Color.fromARGB(255, 82, 138, 197),
                          backgroundColor: Colors.black,
                        ),),
                        Text("Cargando Estudiantes"),
                        Padding(padding: EdgeInsets.all(20)),
                      ],
                    )
                    :
                Container(
                  width: screenSize.width * 0.95,
                  height: screenSize.height * 0.04,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1),
                        right: BorderSide(width: 1),
                        left: BorderSide(width: 1)),
                  ),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths:  {
                      0: FlexColumnWidth(screenSize.width*0.007),
                      1: FlexColumnWidth(screenSize.width*0.003),
                      2: FlexColumnWidth(screenSize.width*0.0057),
                    },
                    border: TableBorder.all(),
                    children:  [
                      TableRow(children: [
                        TableCell(
                          child: Center(child: Text("Nombre completo",style: TextStyle(fontSize: textSize2,fontStyle: FontStyle.italic))),
                        ),
                        TableCell(
                          child: Center(child: Text("Marcar\nAsistencia",style: TextStyle(fontSize: textSize2,fontStyle: FontStyle.italic))),
                        ),
                        TableCell(
                          child: Center(child: Text("Justificación",style: TextStyle(fontSize: textSize2,fontStyle: FontStyle.italic))),
                        )
                      ])
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.95,
                  height: screenSize.height * 0.45,
                  decoration:const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1),
                        right: BorderSide(width: 1),
                        left: BorderSide(width: 1)),
                  ),
                  child: ListView.builder(
                    itemCount: nombre.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Crea un botón para cada elemento en la lista de datos
                      return Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths:  {
                          0: FlexColumnWidth(screenSize.width*0.007),
                          1: FlexColumnWidth(screenSize.width*0.003),
                          2: FlexColumnWidth(screenSize.width*0.0057),
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            TableCell(child: Center(child: Text(nombre[index],style: TextStyle(fontSize: textSize2),textAlign: TextAlign.center,))),
                            TableCell(
                                child: Checkbox(
                              value: check[index],
                              onChanged: (bool? newvalue) {
                                setState(() {
                                  check[index] = newvalue ?? false;
                                  if (check[index] == false) {
                                    print(
                                        "El estudiante  '${nie[index]}'no asistio");
                                  } else {
                                    print(
                                        "El estudiante  '${nie[index]}'si asistio ");
                                  }
                                });
                              },
                            )),
                            TableCell(
                                child: Center(
                                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (check[index] == true)
                                  const Text("")
                                else
                                  Container(
                                    width: screenSize.width * 0.32,
                                    height: screenSize.height * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          if(justi[index]=="S"){
                                          justi[index] = "N";
                                        }else{
                                          justi[index]="S";
                                        }
                                        });
                                      },
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: justi[index]=="S"?const Text("Quitar\nJustificacion"):const Text("Agregar\nJustificacion")),
                                    ),
                                  )
                              ],
                            ))),
                          ])
                        ],
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(screenSize.height*0.03)),
                if (isLoading)
              Column(
                children: [
                  Text("${porc}%",style: TextStyle(fontSize: textSize2 ,fontStyle: FontStyle.italic)),
                  Container( 
                    width: screenSize.width*0.9,
                     decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5)
              ),
                    child: LinearProgressIndicator(
                      minHeight: 2,
                      value: _progress,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 5, 73, 126)),
                    ),
                  ),
                   Text("Guardando Asistencia de $name",style: TextStyle(fontSize: textSize2 ,fontStyle: FontStyle.italic))
                ],
              ),
              Padding(padding: EdgeInsets.all(screenSize.height*0.02)),
                Container(
                  width: screenSize.width*0.5,
                  height: screenSize.height*0.05,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromARGB(255, 38, 93, 212),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: MaterialButton(
                    onPressed: isLoading!=true?cargarDatos:(){
                    },
                    child: const Text("Guardar Asistencia",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content: const Text(
                'La conexion es lenta\nIntentalo de nuevo mas tarde'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void cargarDatos() async {
    setState(() {
      isLoading = true; // Muestra la barra de progreso al iniciar la carga
    });
    // Simula una serie de consultas a la base de datos
    String formattedDate = "YYYY-MM-DD";
    var selectDate = DateTime.now();
    var selectTime = TimeOfDay.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectDate);
    String formateTime = selectTime.format(context);
    //preparado para consultas
    try{
    for (var i = 0; i < nie.length; i++) {
      if (check[i] == true) {
        var n = await save(widget.cod, nie[i], widget.anio, widget.turno,
            formateTime, formattedDate, "A", justi[i]);
        if (n == "Error") {
        }
      } else {
        if (justi[i] == "S") {
          var n = await save(widget.cod, nie[i], widget.anio, widget.turno,
              formateTime, formattedDate, "N", justi[i]);
          if (n == "Error") {
          }
        } else {
          var n = await save(widget.cod, nie[i], widget.anio, widget.turno,
              formateTime, formattedDate, "N", justi[i]);
          if (n == "Error") {
          }
        }
      }
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _progress =
            (i + 1) / nie.length;
        porc=(_progress*100).roundToDouble();
        name=nombre[i];
      });
    }
    }catch(e){
      final snackBar = SnackBar(
                                    content:
                                        Text("Ocurrio un error al guardar\nPuede ser un error en la conexion a internet\nError:'${e}'"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
    }
    // Actualiza el progreso
    setState(() {
      isLoading = false; // Oculta la barra de progreso al finalizar la carga
    });
    // Puedes navegar a la pantalla principal o realizar otras acciones
  }
}
