import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:widgets_flutter/widgets/widgets.dart';


class SlideLiquidScreen extends StatefulWidget {
  const SlideLiquidScreen({super.key});

  @override
  State<SlideLiquidScreen> createState() => _SlideLiquidScreenState();
}

class _SlideLiquidScreenState extends State<SlideLiquidScreen> {

  //Declarar variables
  int page = 0; // Posición de la página
  bool enableSlideIcon = true; // Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo
  bool isDarkGlobal = false; // Controla el brillo de la barra de estado


  @override
  Widget build(BuildContext context) {
    final pages = [
      ViewComponent(
        context: context,
        backgroundColor: const Color.fromRGBO(30, 42, 54, 1.0),
        assetImage: const AssetImage("assets/paisajes/paisaje-1.jpeg"),
        title1: 'Nisi esse exercitation.',
        title2: 'Ipsum ad ullamco minim.',
        subtitle: 'Velit sint deserunt dolor aliqua fugiat cupidatat commodo.',
        isDark: false,
      ),
      ViewComponent(
        context: context,
        backgroundColor: const Color.fromRGBO(22, 20, 25, 1.0),
        assetImage: const AssetImage("assets/paisajes/paisaje-2.jpg"),
        title1: 'Consequat anim ad laboru.',
        title2: 'Pariatur non eiusmod labore.',
        subtitle: 'Proident ut anim laborum eu quis nostrud occaecat nulla amet.',
        isDark: false,
      ),
      ViewComponent(
        context: context,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        assetImage: const AssetImage("assets/paisajes/paisaje-3.jpeg"),
        title1: 'Nulla adipisicing duis est.',
        title2: 'Proident non reprehenderit elit.',
        subtitle: 'Esse Lorem incididunt incididunt dolor irure amet sunt volupta.',
        isDark: false,
      ),
      ViewComponent(
        context: context,
        backgroundColor: const Color.fromRGBO(14, 53, 82, 1.0),
        assetImage: const AssetImage("assets/paisajes/paisaje-4.jpeg"),
        title1: 'Amet amet deserunt magna.',
        title2: 'In sunt sunt anim eiusmod.',
        subtitle: 'Mollit do ex veniam proident duis laborum nostrud dolor tempor.',
        isDark: false,
      ),
      ViewHome(
        context: context,
        text: 'Regresar',
        backgroundColor: Colors.white,
        isDark: true,
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
      if (3 == page) {
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
}

