import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.grosorSecundario,
    required this.grosorPrimario
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  //*Controlador Para animar
  late AnimationController controller;
  late double porcentajeAnterior;

 //*Metodos Init y Dispose
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));



    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //

  @override
  Widget build(BuildContext context) {

    //*Llamamos al controller
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget? child) {
        //print(controller.value.toString());
        return Container(
          padding: const EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorSecundario,
              widget.grosorPrimario,
            ),
          ),
        );
      },
    );

  }
}


//*CLASE DE ANIMACION DEL PROGRESS
class _MiRadialProgress extends CustomPainter {


  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorSecundario,
    this.grosorPrimario,
  );

  @override
  void paint(Canvas canvas, Size size) {


    //*DEFINICION DEL LAPIZ CIRCULO COMPLETADO
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //*ARCO
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //*Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi/2,
      arcAngle,
      false,
      paintArco,
    );



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}