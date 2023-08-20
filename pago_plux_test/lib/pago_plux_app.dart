//import 'package:pago_plux_test/src/screens/Errores/index.dart';
import 'package:pago_plux_test/src/services/index.dart';

import 'package:flutter/material.dart';
import 'package:pago_plux_test/src/screens/index.dart';
import 'package:provider/provider.dart';

import '/src/widgets/index.dart';

class PagoPluxApp extends StatefulWidget {
  
  const PagoPluxApp({Key? key}) : super (key: key);

  @override
  State<PagoPluxApp> createState() => PagoPluxAppState();
}

class PagoPluxAppState extends State<PagoPluxApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProspectoTypeService('', ''),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AutenticacionService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PagoService(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        builder: (varContext, varChild) {
            return MaxScaleTextWidget(
              max: 1.0,
              child: varChild,
            );
          },
          debugShowCheckedModeBanner: false,
          title: '',
          initialRoute: CheckAuthScreen.routerName,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: messengerKey,
          home: PrincipalScreen(),
          theme: ThemeData(
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
            ),
          ),
          routes: {
            AuthenticationScreen.routerName: (_) => const AuthenticationScreen(),
            AutenticacionErrorScreen.routerName: (_) => AutenticacionErrorScreen(null,'', '','',false,false,'',''),
            CheckAuthScreen.routerName: (_) => const CheckAuthScreen(),
            RegistroUsuarioScreen.routerName: (_) => RegistroUsuarioScreen(),
            ContraseniaScreen.routerName: (_) => ContraseniaScreen(correoUser: ''),
            HistorialCobroScreen.routerName: (_) => HistorialCobroScreen(),
          }
      ),
    );
  }
}