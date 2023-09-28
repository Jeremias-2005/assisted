import 'package:assisted/screens/profesor.dart';
import 'package:flutter/material.dart';

import '../developer/consultasf.dart';

void main() {
  runApp(ElecProfe(
    cod: '',
    materia: '',
  ));
}

class ElecProfe extends StatefulWidget {
  String cod;
  String materia;
   ElecProfe({super.key,required this.cod,required this.materia});

  @override
  State<ElecProfe> createState() => _ElecProfeState();
}

class _ElecProfeState extends State<ElecProfe> {
  var result;
  var result2;
  List cod=[];
  List seccion=[];
  List cod_seccion=[];
  @override
  void initState() {
    super.initState();
    getGYS();
  }
   Future<void> getGYS() async {
    result = await getG(widget.cod);
    result2= await getS(widget.cod);
    for(var i=0; i < result.length; i++){
      var dato = result[i];
      var dato2=result2[i];
      var c=dato["c_grado"];
      var cS=dato2["c_se"];
      var s=dato2["seccion"];
      setState(() {  
        cod.add(c);
        seccion.add(s);
        cod_seccion.add(cS);
      });
    }
    }
  String? option1;
  String? option2;
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
          backgroundColor: const Color.fromARGB(255, 80, 134, 193) ,
          leading: MaterialButton(onPressed: (){
            Navigator.pop(context);
          },
          child: const Center(
            child: Icon(Icons.arrow_back,color: Color.fromARGB(255, 223, 211, 211),),
          ),),
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text("Materia : ${widget.materia}")),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Elección de Sección",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 240, 233, 233),
                  fontSize: textSize2,//cambiar
                  ),
                  ),
                 Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: const  Color.fromARGB(255, 64, 108, 155),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10),
                   boxShadow:const [
                      BoxShadow(
                        color: Color.fromARGB(255, 37, 35, 35),
                        offset: Offset(0, 2),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                   ]
                  ),
                  child: ListView.builder(
                    itemCount: seccion.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Crea un botón para cada elemento en la lista de datos
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 89, 149, 212),
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                   toggleable: true,
                                    activeColor: const  Color.fromARGB(255, 34, 67, 94),
                                    value: seccion[index],
                                    groupValue: option1,
                                    onChanged: (value){
                                      setState(() {
                                        option1= value;
                                      });
                                    },   
                                ),
                                Text(seccion[index],style: TextStyle(fontSize: textSize),),//ajustar
                              ],
                            ),
                          ),
                           Padding(padding: EdgeInsets.all(screenSize.width * 0.015))
                        ],
                      );
                      
                    },
                  ),
                ),
        
                 Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
        
                 Text("Elección de Año",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color:const Color.fromARGB(255, 240, 233, 233),
                  fontSize: textSize2,//cambiar
                  ),
                  ),
                 Padding(padding: EdgeInsets.all(screenSize.width * 0.03)),
        
                Container(
                  padding: const EdgeInsets.all(10),
                  height: screenSize.height * 0.2,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: const  Color.fromARGB(255, 64, 108, 155),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10),
                   boxShadow:const [
                      BoxShadow(
                        color: Color.fromARGB(255, 37, 35, 35),
                        offset: Offset(0, 2),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                   ]
                  ),
                  child: ListView.builder(
                    itemCount: cod.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Crea un botón para cada elemento en la lista de datos
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 89, 149, 212),
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                   toggleable: true,
                                    activeColor: const  Color.fromARGB(255, 34, 67, 94),
                                    value: cod[index],
                                    groupValue: option2,
                                    onChanged: (value){
                                      setState(() {
                                        option2= value;
                                      });
                                    },   
                                ),
                                Text(cod[index],style: TextStyle(fontSize: textSize),),//ajustar
                              ],
                            ),
                          ),
                           Padding(padding: EdgeInsets.all(screenSize.width * 0.015))
                        ],
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(screenSize.width * 0.1)),
                MaterialButton(onPressed: (){
                  if(option1==null || option2 ==null){
                    _alert(context,option2,option1);
                  }else{
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => Profe()),
                                );
                  print(option2);
                  print(option1);
                  
                  }
                },
                child:Container(
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 89, 149, 212) ,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenSize.width * 0.25,
                  height: screenSize.height * 0.05,
                  child:  Center(child: Text("Continuar",style: TextStyle(fontSize: textSize),))),)
               
              ],
            ),
          ),
        ),
      ),
    );
  }
 void _alert(BuildContext context, var grado, var seccion) {
  Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 30.00 : 17.00;
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >600 ? 40.00 : 25.00;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 75, 126, 180),
            title: Row(
              children:  [
                 Text("¡AVISO!",style: TextStyle(fontSize: textSize2),),
                 const Icon(Icons.warning,color: Color.fromARGB(255, 219, 172, 32),)
              ],
            ),
            content: SizedBox(
              height: screenSize.height * 0.08,
              child: Column(
                children: [
                   Text('Faltaron datos que completar:',style: TextStyle(fontSize: textSize),),
                      Text("Año: ${grado} ",style: TextStyle(fontSize: textSize),),
                      Text("Sección: ${seccion}",style: TextStyle(fontSize: textSize),),
                ],
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:  Text('Aceptar',style: TextStyle(fontSize: textSize,color: Colors.white),),
                ),
              )
            ],
          );
        });
  }

}