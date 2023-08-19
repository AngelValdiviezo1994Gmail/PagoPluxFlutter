import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
//ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

import '../../../environments/index.dart';
import '../index.dart';

CadenaConexion objCadConSplashScreen = CadenaConexion();
ColoresApp objColoresAppSplash = ColoresApp();

class IntroductionScreen extends StatefulWidget {

  const IntroductionScreen({
    Key? key,
  }) : super(key: key);

  static const String routerName = 'introductionScreen';
  @override
  IntroductionScreenState createState() => IntroductionScreenState();

}

class IntroductionScreenState extends State<IntroductionScreen>{

  @override
  void initState() {
    super.initState();
  }

  List<Widget> renderLstCustomTabs(){
    final sizeScreenLst = MediaQuery.of(context).size;
    List<Widget> lstTabs = [
      Container(
        width: sizeScreenLst.width, 
        height: sizeScreenLst.height, 
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv1.png'),
             fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text(''),
                    MaterialButton(
                      shape: const CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
          
            Container(
              color: Colors.transparent,
              width: sizeScreenLst.width * 0.75,
              height: sizeScreenLst.height * 0.2,
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.78,
              height: sizeScreenLst.height * 0.2,
              child: Center(
                child: AutoSizeText(                  
                  '¡Hola!',
                  style: TextStyle(color: objColoresAppSplash.pluxNaranja),                  
                  presetFontSizes: const [84,82,80,78,76,74,72,70,68,66,64,62,60,58,56,54,52,50,48,46,44,42,40,38,36,34,32,30,28,26,24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              width: sizeScreenLst.width * 0.63,
              height: sizeScreenLst.height * 0.1,
              child: const Center(
                child: AutoSizeText(
                  'Estás a un paso de vivir una nueva aventura de pagos.',
                  style: TextStyle(color: Colors.white),
                  presetFontSizes: [36,34,32,30,28,26,24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          ]
        ),
      ),
      
      Container(
        width: sizeScreenLst.width, 
        height: sizeScreenLst.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv3.png'),
             fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: <Widget>[ 
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text(''),
                    MaterialButton(
                      shape: const CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
            
            SizedBox(height: sizeScreenLst.height * 0.03,),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.55,
              height: sizeScreenLst.height * 0.21,
              child: const Center(
                child: AutoSizeText(
                  '',
                  style: TextStyle(color: Colors.transparent),
                  presetFontSizes: [24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.86,
              height: sizeScreenLst.height * 0.125,
              child: const AutoSizeText(
                'Suscríbete y descubre esta nueva experiencia',
                style: TextStyle(color: Colors.white),
                presetFontSizes: [26,24,22,20,18,16,14,12,10,8],
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: sizeScreenLst.height * 0.22,),

            Expanded(
                child: 
                  Center(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: sizeScreenLst.width * 0.8,
                          height: sizeScreenLst.height * 0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizeScreenLst.width * 0.02)),
                            disabledColor: Colors.grey,
                            elevation: 10,
                            color: objColoresAppSplash.pluxNaranja,
                            child: Container( color: Colors.transparent, child: const Text('QUIERO SUSCRIBIRME',style: TextStyle(color: Colors.white, fontSize: 13))),
                            onPressed: () {
                              
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(builder: (context) => RegistroUsuarioScreen()),
                              );
                            }
                          ),
                        ),

                        SizedBox(height: sizeScreenLst.height * 0.03,),

                        Container(
                          color: Colors.transparent,
                          width: sizeScreenLst.width * 0.95,
                          child: const Divider(
                            color: Colors.white60,
                          ),
                        ),
                        
                        SizedBox(height: sizeScreenLst.height * 0.015,),

                        Container(
                          width: sizeScreenLst.width * 0.8,
                          height: sizeScreenLst.height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: objColoresAppSplash.pluxNaranja,
                              width: sizeScreenLst.width * 0.004,
                              style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(sizeScreenLst.width * 0.02)
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => const AuthenticationScreen()),
                              );
                            },
                            child: Container(color: Colors.transparent, alignment: Alignment.center, child: const Text('INICIAR SESIÓN',style: TextStyle(color: Colors.white, fontSize: 13))),
                          )
                        ),
                        
                        SizedBox(height: sizeScreenLst.height * 0.03,),

                    ],
                  )
                ),
              ),

          ],
        ),
      ),
    ];

    return lstTabs;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: IntroSlider(
          isAutoScroll: true,
          renderSkipBtn: const Text('', style: TextStyle(color:  Colors.black),),
          renderNextBtn: const Text('', style: TextStyle(color:  Colors.black),),
          renderDoneBtn: const Text('', style: TextStyle(color:  Colors.black)),
          backgroundColorAllTabs: Colors.black,
          listCustomTabs: renderLstCustomTabs(),
          scrollPhysics: const BouncingScrollPhysics(),           
        ),
      ),
    );
  }


}
