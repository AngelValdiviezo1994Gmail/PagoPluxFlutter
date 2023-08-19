
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:pago_plux_test/screens/Introduction/introduction_screen.dart';
import 'package:pago_plux_test/src/screens/index.dart';
import 'package:pago_plux_test/src/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pago_plux_test/src/_environments/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storagePrincipalScreen = FlutterSecureStorage();
CadenaConexion objCadConPrincipalApp = CadenaConexion();
ColoresApp objColoresAppPrincipal = ColoresApp();
String correoGen = '';

//ignore: must_be_immutable
class PrincipalScreen extends StatefulWidget {
  static const String routerName = 'principalScreen';
  String? correo;

  PrincipalScreen({Key? key, correo}) : super(key: key) {
    correoGen = correo ?? '';
  }

  @override
  PrincipalScreenState createState() => PrincipalScreenState();
}

class PrincipalScreenState extends State<PrincipalScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: varIndexMenu);
  }

  int varIndexMenu = 0;

  final lstPages = <Widget>[
    //ListadoDigimons()
    PagosFrmScreen()
  ];

  @override
  Widget build(BuildContext context) {

    Size sizePrincipal = MediaQuery.of(context).size;
    final authService = Provider.of<AutenticacionService>(context, listen: false);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shadowColor: objColoresAppPrincipal.pluxNaranja,
            leading: 
           
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => SimpleDialog(
                          alignment: Alignment.center,
                          children: [
                            SimpleDialogOption(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: sizePrincipal.width * 0.21,
                                      height: sizePrincipal.height * 0.15,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/gifAlertWarning.gif'),
                                            fit: BoxFit.cover,
                                          ),
                                          color: Colors.transparent),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                        alignment: Alignment.topCenter,
                                        color: Colors.transparent,
                                        width: sizePrincipal.width * 0.41,
                                        height: sizePrincipal.height * 0.15,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: sizePrincipal.width * 0.43,
                                              height: sizePrincipal.height * 0.09,
                                              alignment: Alignment.center,
                                              child: const AutoSizeText(
                                                '¿Estás seguro que deseas cerrar sesión?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold
                                                ),
                                                maxLines: 3,
                                                presetFontSizes: [
                                                  16,
                                                  14,
                                                  12,
                                                  10
                                                ],
                                              ),
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              width: sizePrincipal.width * 0.41,
                                              height: sizePrincipal.height * 0.06,
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: sizePrincipal.width * 0.18,
                                                    height: sizePrincipal.height * 0.04,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.red[400],
                                                    ),
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          Navigator.of(context, rootNavigator: true).pop();
                                                        },
                                                        child: const AutoSizeText(
                                                          'NO',
                                                          maxLines: 1,
                                                          style: TextStyle(color: Colors.white),
                                                          presetFontSizes: [
                                                            12,
                                                            10,
                                                            8,
                                                            6
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                    width: sizePrincipal.width * 0.18,
                                                    height: sizePrincipal.height * 0.04,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.green[400],
                                                    ),
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          authService.logOut();

                                                          Future.microtask(
                                                            () => Navigator.pushReplacement(
                                                              context,
                                                              CupertinoPageRoute(builder:(context) => const IntroductionScreen()),
                                                            ),
                                                          );
                                                        },
                                                        child: const AutoSizeText(
                                                          'SÍ',
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            color: Colors.white
                                                          ),
                                                          presetFontSizes: [ 12, 10, 8, 6],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                )),
                          ]),
                    );
                
                },
              ),
          
            elevation: 0,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: sizePrincipal.width * 0.75,
                  alignment: Alignment.center,
                  child: AutoSizeText(correoGen,style: TextStyle(color: Colors.white),),
                )
              ]
            ),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
            ],
          ), 
        )
      ),
    );
  }
  } 