import 'dart:math';
import 'package:flutter/material.dart';


class UnboxingHorizontalScreen extends StatefulWidget {
  const UnboxingHorizontalScreen({super.key});

  @override
  State<UnboxingHorizontalScreen> createState() => _UnboxingHorizontalScreenState();
}

class _UnboxingHorizontalScreenState extends State<UnboxingHorizontalScreen> {
  // var
  final PageController _controller = PageController(initialPage:0);
  Color colorFondo = Colors.white;
  Color colorAccent = Colors.black45;
  Color colorText = Colors.black45;
  List<Widget> _pages = [];

  //Dispose
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    //Creacion de las paginas dentro del arreglo
    _pages=[
      _PageInformation(
        context: context,
        colorIcon: colorAccent,
        iconData: Icons.phone_android,
        colorText: colorText,
        titulo: 'Anim laborum officia culpa voluptate sit dolore excepteur amet nisi sit velit non dolor excepteur.',
        subtitulo: 'Non elit ea quis sint enim proident officia exercitation labore proident duis.'
      ),
      _PageInformation(
        context: context,
        colorIcon: colorAccent,
        iconData: Icons.monetization_on_outlined,
        colorText: colorText,
        titulo: 'Irure Lorem in labore sint eiusmod sint laborum eiusmod ea irure anim adipisicing.',
        subtitulo: 'Voluptate officia aliqua anim dolor laboris.'
      ),
      _PageInformation(
        context: context,
        colorIcon: colorAccent,
        iconData: Icons.attractions_outlined,
        colorText: colorText,
        titulo: 'Laboris enim magna tempor Cupidatat excepteur quis culpa ad id id pariatur sint Lorem nulla est ex ex eu.',
        subtitulo: 'Cupidatat ut consectetur occaecat elit irure culpa exercitation nulla id veniam cupidatat nostrud.'
      ),
      _PageButton(
        context: context,
        texto: 'Iniciar Aplicación',
        textoButton: 'Iniciar',
      ),
    ];

    //Regresamos la ventana
    return Scaffold(
      backgroundColor: colorFondo,
      body: PageView( // Una lista desplazable que funciona página por página. */
        controller: _controller,  //  El initialPageparámetro establecido en 0 significa que el primer elemento secundario del widget PageViewse mostrará primero (ya que es un índice basado en cero) */
        pageSnapping: true, // Deslizaiento automatico */
        scrollDirection: Axis.horizontal, // Dirección de deslizamiento */
        children: _pages,
      ),
      floatingActionButton: _DotsIndicator(pageController: _controller, pages: _pages, colorAccent: colorAccent,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//*PAGINA DE INFORMACION
//Widgets Para Pagina de informacion
class _PageInformation extends StatelessWidget {

  final BuildContext context;
  final Color colorIcon;
  final IconData iconData;
  final Color colorText;
  final String titulo;
  final String subtitulo;

  const _PageInformation({
    required this.context,
    required this.colorIcon,
    required this.iconData,
    required this.colorText,
    required this.titulo,
    required this.subtitulo
  });


  // Devuelve una vista con contenido centrado
  @override
  Widget build(BuildContext context) {
    // Definimos los estilos
    final estiloTitulo = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: colorText);
    final estiloSubTitulo = TextStyle(fontSize: 20.0,color: colorText.withOpacity(0.5));

    // Obtenemos las variables de la dimension de la pantalla */
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: screenSize.width / 3,
              height: screenSize.height / 3,
              child:Icon(
                iconData,
                size: screenSize.width*0.25,
                color: colorIcon
              )
            ),
            Text(
              titulo,
              style: estiloTitulo,
              textAlign: TextAlign.center
            ),

            const SizedBox(height: 40.0),

            Text(
              subtitulo,
              style: estiloSubTitulo,
              textAlign: TextAlign.center
            ),

            const SizedBox(height: 12.0),

            Expanded(
              child: Container()
            ),
          ],
        ),
      ),
    );
  }
}


//*DOTS DE INDICACION
class _DotsIndicator extends StatelessWidget {
  final PageController pageController;
  final List pages;
  final Color colorAccent;

  const _DotsIndicator({
    required this.pageController,
    required this.pages,
    required this.colorAccent,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicatorAnimated(
      color: colorAccent,
      controller: pageController,
      itemCount: pages.length,
      onPageSelected: (int page) {pageController.animateToPage(page,duration: const Duration(milliseconds: 300),curve: Curves.ease);},
      );
  }
}

class DotsIndicatorAnimated extends AnimatedWidget {
  const DotsIndicatorAnimated({
    super.key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.white
  }) : super(listenable: controller);

  // El PageController que representa este DotsIndicator.
  final PageController controller;
  // La cantidad de elementos administrados por PageController
  final int itemCount;
  // Llamado cuando se toca un punto
  final ValueChanged<int> onPageSelected;

  // El color de los puntos.
  // Defaults to `Colors.white`.
  final Color color;
  // El tamaño base de los puntos
  static const double _kDotSize = 8.0;
  // El aumento en el tamaño del punto seleccionado.
  static const double _kMaxZoom = 2.0;
  // La distancia entre el centro de cada punto
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index  ) {

    double selectedness = Curves.easeOut.transform(max(0.0,1.0 - ((controller.hasClients ?controller.page??0:controller.initialPage ) - index).abs()));
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;

    return SizedBox(
      width: _kDotSpacing,height: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: SizedBox(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(onTap: () => onPageSelected(index) ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

//*BOTON FINAL
//Widget pantalla con boton
// ignore: must_be_immutable
class _PageButton extends StatelessWidget {

  final BuildContext context;
  final String texto;
  final String textoButton;


  _PageButton({
    required this.context,
    required this.texto,
    required this.textoButton,
  });

  //MaterialColor color =Colors.blue;
  Color colorText=Colors.white;

  // Devuelve una vista con un boton central */
  final TextStyle estiloTitulo = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black45);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(foregroundColor: Colors.black45, backgroundColor: Colors.black45,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,height: double.infinity,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                texto,
                style: estiloTitulo,
                textAlign: TextAlign.center
              )
            ),
            ElevatedButton(
              style:raisedButtonStyle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Text(textoButton,
                  style: TextStyle(fontSize: 20.0,color: colorText)
                )
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}