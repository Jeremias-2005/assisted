import 'package:assisted/screens/formp.dart';
import 'package:assisted/screens/formsub.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
    
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  Widget build(BuildContext context) {
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

                  const SizedBox(
                height: 2.0,
              ),

            GradientText(
                '¿COMO DESEA INICIAR SESIÓN?',
                style: const TextStyle(
                    fontSize: 27.0,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 240, 238, 247),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                ],
            ),

            const SizedBox(
                height: 20.0,
              ),

            Container(
            width: 200, // Ancho del cuadro gris
            height: 200, // Alto del cuadro gris
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               color: Colors.grey, // Color de fondo gris
            ),
            child:  Center(
              child: MaterialButton(
                    child: const Image(image: AssetImage('assets/sub.png')),
                    onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Forms(),));
                          },
                    )
              ),
              ),

             SizedBox(
                height: 30,
              ),

             Container(
            width: 200, // Ancho del cuadro gris
            height: 200, // Alto del cuadro gris
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               color: Colors.grey, // Color de fondo gris
            ),
            child:  Center(
              child: MaterialButton(
                    child: const Image(image: AssetImage('assets/profesor.png')),
                    onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Formp(),));
                          },
                    )
              ),
            )
                ],
              ),
            ),
            );
}
}