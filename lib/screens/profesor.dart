import 'package:flutter/material.dart';

void main() {
  runApp(Profe());
}

class Profe extends StatefulWidget {
  @override
  State<Profe> createState() => _ProfeState();
}

class _ProfeState extends State<Profe> {
  // Definir una lista de datos
  final List<String> datos = ["Dato 1", "Dato 2", "Dato 3", "Dato 4"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botones con Datos'),
        ),
        body: ListView.builder(
          itemCount: datos.length,
          itemBuilder: (BuildContext context, int index) {
            // Crea un botón para cada elemento en la lista de datos
            return ListTile(
              title: Text(datos[index]),
              trailing: ElevatedButton(
                onPressed: () {
                  // Cuando se presiona el botón, identifica el dato correspondiente
                  String datoSeleccionado = datos[index];
                  print('Se presionó el botón para $datoSeleccionado');
                },
                child: Text('Presionar'),
              ),
            );
          },
        ),
      ),
    );
  }
}