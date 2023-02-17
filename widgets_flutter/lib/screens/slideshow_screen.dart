import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderShowScreen extends StatefulWidget {
  const SliderShowScreen({super.key});

  @override
  State<SliderShowScreen> createState() => _SliderShowScreenState();
}

class _SliderShowScreenState extends State<SliderShowScreen> {

  late final PageController pageController;
  int pageNo = 0;

  List<String> strSVG = [
    'assets/svgs/slide-1.svg',
    'assets/svgs/slide-2.svg',
    'assets/svgs/slide-3.svg',
  ];

  late final Timer carruselTimer;

  //* Automatizador del Slider
  Timer getTimer(){
    return Timer.periodic(const Duration(seconds: 3), (timer) { 
      if(pageNo == strSVG.length){
        pageNo = 0;
      }
      pageController.animateToPage(pageNo, duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
      pageNo++;
    });
  }


  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    carruselTimer  = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index){
                  pageNo = index;
                  setState(() {
                  });
                },
                itemBuilder: (_, index){
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child){
                      return child!;
                    },
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hola, Tocaste la tarjeta numero: ${index+1}")));
                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(strSVG[index]),
                      ),
                    ),
                  );
                },
                itemCount: strSVG.length,
              ),
            ),
            SizedBox(
              height: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  strSVG.length,
                  (index) => Container(
                    margin: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.circle,
                      size: 12,
                      color: pageNo == index
                        ? Colors.amberAccent
                        :Colors.grey.shade300,
                    ),
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















































