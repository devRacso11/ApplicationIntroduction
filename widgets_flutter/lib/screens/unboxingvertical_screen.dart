import 'package:flutter/material.dart';
import 'package:widgets_flutter/widgets/widgets.dart';


class UnboxingVerticalScreen extends StatelessWidget {
  const UnboxingVerticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body(context: context),
    );
  }
  /// WIDGETS COMPONENTS
  Widget body({required BuildContext context}){
    return PageView(
      controller: PageController(  initialPage: 0 ),
      pageSnapping: true, //  Deslizaiento automatico */
      scrollDirection: Axis.vertical, //  Dirección de deslizamiento  */
      children: <Widget>[
        ViewComponent(
          context: context,
          backgroundColor: const Color.fromRGBO(30, 42, 54, 1.0),
          assetImage: const AssetImage("assets/paisajes/paisaje-1.jpeg"),
          title1: 'Nisi esse exercitation.',
          title2: 'Ipsum ad ullamco minim.',
          subtitle: 'Velit sint deserunt dolor aliqua fugiat cupidatat commodo.',
          isDark: false,
          icon: Icons.keyboard_arrow_down_rounded,
        ),
        ViewComponent(
          context: context,
          backgroundColor: const Color.fromRGBO(22, 20, 25, 1.0),
          assetImage: const AssetImage("assets/paisajes/paisaje-2.jpg"),
          title1: 'Consequat anim ad laboru.',
          title2: 'Pariatur non eiusmod labore.',
          subtitle: 'Proident ut anim laborum eu quis nostrud occaecat nulla amet.',
          isDark: false,
          icon: Icons.keyboard_arrow_down_rounded,
        ),
        ViewComponent(
          context: context,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
          assetImage: const AssetImage("assets/paisajes/paisaje-3.jpeg"),
          title1: 'Nulla adipisicing duis est.',
          title2: 'Proident non reprehenderit elit.',
          subtitle: 'Esse Lorem incididunt incididunt dolor irure amet sunt volupta.',
          isDark: false,
          icon: Icons.keyboard_arrow_down_rounded,
        ),
        ViewComponent(
          context: context,
          backgroundColor: const Color.fromRGBO(14, 53, 82, 1.0),
          assetImage: const AssetImage("assets/paisajes/paisaje-4.jpeg"),
          title1: 'Amet amet deserunt magna.',
          title2: 'In sunt sunt anim eiusmod.',
          subtitle: 'Mollit do ex veniam proident duis laborum nostrud dolor tempor.',
          isDark: false,
          icon: Icons.keyboard_arrow_down_rounded,
        ),
        ViewHome(
          context: context,
          text: 'Regresar',
          backgroundColor: Colors.white,
          isDark: true,
        ),
      ],
    );
  }
}