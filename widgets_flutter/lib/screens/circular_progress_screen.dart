import 'package:widgets_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {

  late double porcentaje=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Progress'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            porcentaje+=10;
            if(porcentaje>100){
              porcentaje = 0.0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.pink.shade900,
                colorSecundario: Colors.pink.shade300,
                grosorPrimario: 5,
                grosorSecundario: 6,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.green.shade900,
                colorSecundario: Colors.green.shade100,
                grosorPrimario: 10,
                grosorSecundario: 3,
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.indigo,
                colorSecundario: Colors.grey,
                grosorPrimario: 10,
                grosorSecundario: 4,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.red.shade900,
                colorSecundario: Colors.red.shade200,
                grosorPrimario: 7,
                grosorSecundario: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.grosorPrimario,
    required this.grosorSecundario,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      //color: Colors.deepOrange,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorSecundario: grosorSecundario,
        grosorPrimario: grosorPrimario,
      ),
    );
  }
}