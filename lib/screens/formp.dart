import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultasf.dart';
import 'materia_profe.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Formp(),
  ));
}

class Formp extends StatefulWidget {
  const Formp({super.key});

  @override
  State<Formp> createState() => _FormpState();
}

class _FormpState extends State<Formp> {
  bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();



  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 80, 134, 193),
        title: Center(
          child: GradientText(
            'Bienvenido',
            style: const TextStyle(
              fontSize: 50.0,
            ),
            gradientType: GradientType.linear,
            gradientDirection: GradientDirection.ttb,
            radius: 2.5,
            colors: const [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 222, 223, 231),
              Color.fromARGB(255, 198, 204, 211),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 80, 134, 193),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cuerpo del formulario
            Cuerpo(),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                const SizedBox(
                  height: 180,
                ),
                SizedBox(
                  height: 40,
                  child: MaterialButton(
                    color: const Color.fromARGB(255, 41, 64, 185),
                    onPressed: () {
                       Navigator.pop(context);
                     
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
               SizedBox(
                height: 40,
                 child: MaterialButton(
                  color: const Color.fromARGB(255, 41, 64, 185),
                  onPressed: () async{
                    var codigo;
                    usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    var result =await  comprobarProfe(usuariobd,contrabd);
                    if(result!="Error"){//comprobar
                         for(var i=0; i<result.length; i++){
                      var dato=result[i];
                      codigo=dato["c_profe"];
                      print(codigo);
                    }
                     if(codigo!=0){
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Elec_materia(c_profe: codigo,)),
                      );
                     }else{
                      // ignore: use_build_context_synchronously
                      _mensajeUsu(context);
                     }
                    }else{
                      _mensaje(context);
                    }
                   
               
                  },
                  child: const Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 25),),
                  ),
               ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//widgets que forman la aplicacion
// ignore: non_constant_identifier_names
  Widget Cuerpo() {
    return Center(
      child: Column(children: <Widget>[
        espacio(),
        control(),
        const SizedBox(
          height: 40,
        ),
        usuario(),
        const SizedBox(
          height: 30,
        ),
        contrasena(),
      ]),
    );
  }

  Widget control() {
    return  const Center(child: 
                   SizedBox(
                    height: 100,  
                    width: 400,
                  child: 
                   Image(image: AssetImage('assets/asis.png'))
                   )
                   );
  }

  Widget espacio() {
    return const SizedBox(
      height: 50,
    );
  }


  Widget usuario() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: usuariob,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          counterStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          hintText: "Usuario",
        ),
      ),
    );
  }

Widget contrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: TextField(
      controller: contrab,
      obscureText: _obscureText,
      decoration:  InputDecoration(
         border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        suffixIcon: GestureDetector(onTap: (){
          setState(() {
            _obscureText=!_obscureText;
          });
        },
        child: Icon(_obscureText ?Icons.visibility : Icons.visibility_off),
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "contraseña",
      ),
    ),
  );
} 

  void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Usuario no existe"),
            content: const Text(
                'Los datos ingresados no coinciden con alguna cuenta de usuario'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content:
                const Text('La conexion es lenta\nIntentalo de nuevo mas tarde'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      usuariob.clear();
                      contrab.clear();
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
}
