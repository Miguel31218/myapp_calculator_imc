import 'dart:math';
import 'package:flutter/material.dart';

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
  // Se crea una clase privada solo para este archivo
  double b = 0;
  double a = 0;

  void condiciones() {
    if (0 < calculadora && calculadora < 18) {
      calculadora == "Bajo Peso";
    } else if (18.5 <= calculadora && calculadora <= 24.9) {
      calculadora == "B33333o";
    } else if (25 <= calculadora && calculadora <= 29.9) {
      calculadora == "llll";
    } else if (30 <= calculadora) {
      calculadora == "Bdsdsd";
    }
  }

  double calculadora = 0;
  void sliderCalculo() {
    calculadora = b * 1 / (a * a);
  }

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
          Slider(
            value: a,
            min: 0, // valor minimo
            max: 3, // valor maximo hasta donde va llegar
            onChanged: (num) {
              a = num; // num es una variable local
              setState(() {});
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Peso",
            style: TextStyle(height: 3, fontSize: 17),
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
          Slider(
            value: b,
            min: 0, // valor minimo de peso en Kg
            max: 200, // valor maximo hasta donde va llegar el peso
            onChanged: (num) {
              b = num; // num es una variable local
              setState(() {});
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300,
            child: ElevatedButton(
                onPressed: () {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                calculadora.toStringAsFixed(
                    2), // el AsFixed sirve para colocar la cantidad de decimales a la derecha
                style: TextStyle(
                  fontSize: 45.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
