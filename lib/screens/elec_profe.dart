import 'package:assisted/screens/profesor.dart';
import 'package:flutter/material.dart';

import '../developer/consultasf.dart';

void main() {
  runApp(ElecProfe(
    cod: '',
    materia: '',
    codigo: '',
  ));
}

class ElecProfe extends StatefulWidget {
  String cod;
  String materia;
  String codigo;
   ElecProfe({super.key,required this.cod,required this.materia, required this.codigo});

  @override
  State<ElecProfe> createState() => _ElecProfeState();
}

class _ElecProfeState extends State<ElecProfe> {
  bool isLoading = true;
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
        isLoading=false; 
        cod.add(c);
        seccion.add(s);
        cod_seccion.add(cS);
      });
    }
    }
  String? option1;
  String? option2;
  String? option3;
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
                  child: isLoading?
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child:CircularProgressIndicator(
                      color: Color.fromARGB(255, 82, 138, 197),
                    backgroundColor: Colors.black,
                  ),)

                  :
                  ListView.builder(
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
                                    value: cod_seccion[index],
                                    groupValue: option1,
                                    onChanged: (value){
                                      setState(() {
                                      
                                        option1= value;
                                        print(option1);
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
                  child: isLoading?
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child:CircularProgressIndicator(
                      color: Color.fromARGB(255, 82, 138, 197),
                    backgroundColor: Colors.black,
                  ),)

                  :
                  ListView.builder(
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
                Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
        
                 Text("Elección de Turno",
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
                  child: Column(
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
                                    value: "1",
                                    groupValue: option3,
                                    onChanged: (value){
                                      setState(() {
                                        option3= value;
                                        print(option3);
                                      });
                                    },   
                                ),
                                Text("Turno Matutino",style: TextStyle(fontSize: textSize),),//ajustar
                              ],
                            ),
                          ),
                           Padding(padding: EdgeInsets.all(screenSize.width * 0.015)),
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
                                    value: "2",
                                    groupValue: option3,
                                    onChanged: (value){
                                      setState(() {
                                        option3= value;
                                        print(option3);
                                      });
                                    },   
                                ),
                                Text("Turno Vespertino",style: TextStyle(fontSize: textSize),),//ajustar
                              ],
                            ),
                          ),
                        ],
                      )
                ),
                Padding(padding: EdgeInsets.all(screenSize.width * 0.05)),
                MaterialButton(onPressed: (){
                  if(option1=="" || option2 =="" || option3==null){
                    _alert(context,option2,option1,option3);
                  }else{
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => Profe(anio: option2, section: option1,turno: option3,materia: widget.materia,cod: widget.codigo)
                                )
                     );
                  
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
 void _alert(BuildContext context, var grado, var seccion,var turno) {
    grado??="Falto completar";
    seccion??="Falto completar";
    turno??="Falto completar";
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
              height: screenSize.height * 0.11,
              child: Column(
                children: [
                   Text('Faltaron datos que completar:',style: TextStyle(fontSize: textSize),),
                      Text("Año: ${grado} ",style: TextStyle(fontSize: textSize),),
                      Text("Sección: ${seccion}",style: TextStyle(fontSize: textSize),),
                      Text("turno: ${turno}",style: TextStyle(fontSize: textSize),),
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