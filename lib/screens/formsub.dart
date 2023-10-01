import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'consultassub.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Forms(),
  ));
}

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();



  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
  final now = DateTime.now();
  final fecha ="${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
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
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstRoute()),
                      );
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
                  onPressed:  () async{
                    usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    //comprobacion de usuario y contraseña
                    if (usuariobd.isNotEmpty || contrabd.isNotEmpty) {
                    dynamic respuesta = await comprobara(usuariobd,contrabd);
                    if (respuesta == "error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //no hay usuario con ese nombre
                      _mensajeUsu(context);
                    } else {
                         if(respuesta == "sub"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Consultass(fecha1: fecha)),
                   );
                      }
                    }
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
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
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
