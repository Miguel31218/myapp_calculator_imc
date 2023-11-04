import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp1/models/heroModel.dart';

void main() {
  runApp(
    MaterialApp(
      home: SliderExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SliderExample extends StatefulWidget {
  // El StateFul permite actualizar el código redibujando denuevo todo. Shorckut para generar este state es descargando la extension Awesome Flutter Snnipets
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  List<HeroModel> indiceList = [
    HeroModel(
      name: "",
      descripcion: "",
    ),
    HeroModel(
      name: "Bajo Peso",
      descripcion:
          "Se tiene que consumir más alimentos que contengan los nutrientes necesarios.",
    ),
    HeroModel(
      name: "Normal",
      descripcion: "Su IMC es normal, mantengase en una dieta balanceada.",
    ),
    HeroModel(
      name: "Sobrepeso",
      descripcion:
          "Salga a correr 1 o 2 veces a la semana y beba bastante agua.",
    ),
    HeroModel(
      name: "Obeso",
      descripcion:
          "Realice una dieta balanceada y ejercicio 4 a 5 veces a la semana.",
    )
  ];
  // Se crea una clase privada solo para este archivo
  String resultName = "";
  String recomendDescription = "";
  double n = 0;
  double b = 0;
  double a = 0;
  int x = 0;

  void sliderCalculo() {
    n = b * 1 / (a * a);
  }

  @override
  void condiciones() {
    if (0 < n && n < 18) {
      x = 1;
    } else if (18.5 <= n && n <= 24.9) {
      x = 2;
    } else if (25 <= n && n <= 29.9) {
      x = 3;
    } else if (30 <= n) {
      x = 4;
    }
  }
  // TODO: implement initState

  // variable que creamos para cambiarlo de acuerdo a que cambie el slider.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text(
            "Calcular IMC",
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
          Text(
            "Altura",
            style: TextStyle(fontSize: 17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                a.toStringAsFixed(
                    2), // el AsFixed sirve para colocar la cantidad de decimales a la derecha
                style: TextStyle(
                  fontSize: 45.0,
                ),
              ),
              Text(
                "mt",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Slider(
              value: a,
              min: 0, // valor minimo
              max: 3, // valor maximo hasta donde va llegar
              onChanged: (num) {
                a = num; // num es una variable local
                setState(() {});
              },
            ),
          ),
          Text(
            "Peso",
            style: TextStyle(fontSize: 17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                b.toStringAsFixed(
                    1), // el AsFixed sirve para colocar la cantidad de decimales a la derecha
                style: TextStyle(
                  fontSize: 45.0,
                ),
              ),
              Text(
                "Kg",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Slider(
              value: b,
              min: 0, // valor minimo de peso en Kg
              max: 200, // valor maximo hasta donde va llegar el peso
              onChanged: (num) {
                b = num; // num es una variable local
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  resultName = indiceList[x].name;
                  recomendDescription = indiceList[x].descripcion;
                  sliderCalculo();
                  condiciones();
                  setState(() {});
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  n.toStringAsFixed(
                      2), // el AsFixed sirve para colocar la cantidad de decimales a la derecha
                  style: TextStyle(
                    fontSize: 45.0,
                  ),
                ),
                Divider(),
                Text(
                  "${indiceList[x].name}",
                  style: TextStyle(fontSize: 17.0, color: Colors.purple),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${indiceList[x].descripcion}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
