import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Soy un Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Contenido de la Alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.green)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Contenido de la Alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.green)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Mostrar Alerta',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onPressed: () => Platform.isAndroid
              ? displayDialogAndroid(context)
              : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
