import 'package:flutter/material.dart';

//Devuelve una vista de una imagen y texto reutilizable
class ViewComponent extends StatelessWidget {
  final BuildContext context;
  final AssetImage assetImage;
  final String title1;
  final String title2;
  final String subtitle;
  final Color backgroundColor;
  final bool isDark;

  const ViewComponent({
    super.key,
    required this.context,
    required this.assetImage,
    this.title1 = '',
    this.title2 = '',
    this.subtitle = '',
    this.backgroundColor = Colors.white,
    this.isDark = false

  });


  @override
  Widget build(BuildContext context) {

    // Toma los pixeles del ancho y alto de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      //padding: EdgeInsets.all(20.0),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: assetImage,
                width: screenWidth,
                height: screenHeight * 0.4,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Container()),
                    InkWell(
                      onTap: (){ Navigator.pop(context); },
                      child: Text("Omitir",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: isDark
                            ? Colors.black
                            : Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            height: screenHeight * 0.6,
            margin: const EdgeInsets.only(right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title2,
                  style: TextStyle(fontSize: 25.0,
                  color: isDark ? Colors.grey : Colors.white,
                  fontFamily: "Product Sans"),
                ),
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: isDark ? Colors.black : Colors.white,
                    fontFamily: "Product Sans",
                    fontWeight: FontWeight.bold,
                  )
                ),
                const SizedBox(height: 20.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.grey : Colors.white,
                    fontSize: 20.0,
                    fontFamily: "Product Sans",
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}