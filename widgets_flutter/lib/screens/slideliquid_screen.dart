/// Copyright 2020 Logica Booleana Authors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/// Dependencias 
/// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:liquid_swipe/liquid_swipe.dart';

///  DESCRIPCIÓN
///  Creamos una introduccion de la aplicación, con un efecto desplazable horizontal liquido 

class SlideLiquidScreen extends StatefulWidget {
  const SlideLiquidScreen({super.key});

  @override
  _SlideLiquidScreenState createState() => _SlideLiquidScreenState();
}

class _SlideLiquidScreenState extends State<SlideLiquidScreen> {
  
  /// Declarar variables 
  int page = 0; // Posición de la página 
  bool enableSlideIcon = true; // Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo 
  bool isDarkGlobal = false; // Controla el brillo de la barra de estado

  @override
  Widget build(BuildContext context) {
    final pages = [
      viewcomponent(
          context: context,
          colorFondo: Color.fromRGBO(30, 42, 54, 1.0),
          assetImage: AssetImage("assets/paisajes/paisaje-1.jpeg"),
          titulo2: "Más de 100.000",
          titulo1: "Paisajes Hermosos",
          subtitulo: "Inspirate en muchas ilustraciones, diseños creados con Flutter por miles de usuarios",
          isDark: false
          ),
      viewcomponent(
          context: context,
          colorFondo: Color.fromRGBO(22, 20, 25, 1.0),
          assetImage: AssetImage("assets/paisajes/paisaje-2.jpg"),
          titulo2: "",
          titulo1: "Descubre nuevos amigos",
          subtitulo: "Hace scroll y sumérgete con mucho contenido generados por nuestra comunidad",
          isDark: false
          ),
      viewcomponent(
          context: context,
          colorFondo: Color.fromRGBO(0, 0, 0, 1.0),
          assetImage: AssetImage("assets/paisajes/paisaje-3.jpeg"),
          titulo2: "Más de 300.000",
          titulo1: "Usuarios",
          subtitulo: "que dan soluciones, comparte y crean ilustraciones espectaculares",
          isDark: false
          ),
      viewcomponent(
          context: context,
          colorFondo: Color.fromRGBO(14, 53, 82, 1.0),
          assetImage: AssetImage("assets/paisajes/paisaje-4.jpeg"),
          titulo2: "Miles de imagenes y venctores",
          titulo1: "Gratis y premium",
          subtitulo: "Sube, descarga y comparte con tus compañeros o amigos",
          isDark: false
          ),
      vistaPerzonalizada(
        context: context,
        texto: "Home", 
        colorFondo: Colors.white, 
        isDark: true
        ),
    ];
    // Cambia el brillo de la barra de estado segun el el brillo pasado en cada vista
    SystemChrome.setSystemUIOverlayStyle(isDarkGlobal ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);

    return Scaffold(
      body: Builder(
          builder: (context) => LiquidSwipe(
                initialPage: 0,
                fullTransitionValue: 500, // Establece la distancia de desplazamiento o la sensibilidad para un deslizamiento completo. */
                enableLoop: false, // Habilitar o deshabilitar la recurrencia de páginas. */
                positionSlideIcon: 0.45, // Coloque su icono en el eje y en el lado derecho de la pantalla */
                slideIconWidget: Icon(Icons.arrow_back_ios,color: isDarkGlobal ? Colors.black : Colors.white),
                pages: pages, // Establecer las páginas / vistas / contenedores */
                onPageChangeCallback: onPageChangeCallback, // Pase su método como devolución de llamada, devolverá un número de página. */
                waveType: WaveType.liquidReveal, // Seleccione el tipo de revelación que desea. */
          )
      ),
    );
  }
  /// liquid_swipe / Pase su método como devolución de llamada, devolverá un número de página. */
  onPageChangeCallback(int lpage) {
    setState(
      // Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo
      () {
      page = lpage;
      if (4 == page) {
        // Esconde el iconButton de desplazamiento */
        enableSlideIcon = false;
        // Aplicar color oscuro al iconButton de deslizamiento */
        isDarkGlobal = true;
      } else {
        // Muestra el iconButton de desplazamiento */
        enableSlideIcon = true;
        // Por default aplica el brillo al iconButton */
        isDarkGlobal = false;
      }
    }
    );
  }
  /// Devuelve una vista reutilizable 
  Container viewcomponent({
    required BuildContext context,
    required AssetImage assetImage,
    String titulo1 = "",
    String titulo2 = "",
    String subtitulo = "",
    Color colorFondo = Colors.white,
    bool isDark = false,
  }) {
    // Toma los pixeles del ancho y alto de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      //padding: EdgeInsets.all(20.0),
      color: colorFondo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(image: assetImage,width: screenWidth,height: screenHeight * 0.4,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Container()),
                    InkWell(onTap: (){ Navigator.pop(context); },child: Text("Omitir",style: TextStyle(fontSize: 20.0,color: isDark ? Colors.black : Colors.white,fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            height: screenHeight * 0.6,
            margin: EdgeInsets.only(right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(titulo2,style: TextStyle(fontSize: 25.0,color: isDark ? Colors.grey : Colors.white,fontFamily: "Product Sans"),),
                Text(titulo1,style: TextStyle(fontSize: 30.0,color: isDark ? Colors.black : Colors.white,fontFamily: "Product Sans",fontWeight: FontWeight.bold,)),
                SizedBox(height: 20.0),
                Text(subtitulo,style: TextStyle(color: isDark ? Colors.grey : Colors.white,fontSize: 20.0,fontFamily: "Product Sans",)),
              ],
            ),
          )
        ],
      ),
    );
  }
  // Devuelve una vista con un boton central
  static Container vistaPerzonalizada(
      {
        required BuildContext context,
        String texto = "Iniciar Sesión",
        bool isDark = false,
        Color colorFondo = Colors.white,
        Color colorButton = Colors.blue
      }
      ) {
    return Container(
      color: colorFondo,
      child: Center(
        child:ElevatedButton(
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(colorButton),
            padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            ),
          onPressed: () =>  Navigator.pop(context),
          child: Text(texto,style: TextStyle(fontSize: 20.0),),
          ),
      ),
    );
  }
}