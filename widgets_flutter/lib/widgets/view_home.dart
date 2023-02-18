import 'package:flutter/material.dart';

class ViewHome extends StatelessWidget {
  final BuildContext context;
  final String text;
  final bool isDark;
  final Color backgroundColor;
  final Color buttonColor;

  const ViewHome({
    super.key,
    required this.context,
    this.text = 'Iniciar Sesión',
    this.isDark = false,
    this.backgroundColor = Colors.white,
    this.buttonColor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child:ElevatedButton(
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(buttonColor),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
            ),
          onPressed: () =>  Navigator.pop(context),
          child: Text(text,style: const TextStyle(fontSize: 20.0),),
          ),
      ),
    );
  }
}