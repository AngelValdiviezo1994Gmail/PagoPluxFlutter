

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:pago_plux_test/src/screens/Errores/index.dart';
import 'package:pago_plux_test/src/screens/index.dart';

import '../../bloc/index.dart';

class CheckAuthScreen extends StatelessWidget {
  static const String routerName = 'checkAuthScreen';

  const CheckAuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context,state) {
          return Center(
            child: FutureBuilder(
              future: state.readToken(), 
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

                if(!snapshot.hasData) {
                  return Image.asset(
                    "assets/loadingEnrolApp.gif",
                    height: 150.0,
                    width: 150.0,
                  );
                } else {
                  if(snapshot.data != '') {
                    String datos = snapshot.data!.split('|')[0];
                    String correoGuardado = snapshot.data!.split('|')[1];

                    if(datos == 'NI') {
                        Future.microtask(() => 
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) => const ConexionInternetScreen(),
                            ),
                          )
                        );
                      } else {

                        Future.microtask(() => 
                            Navigator.of(context, rootNavigator: true).pushReplacement(
                              CupertinoPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => PrincipalScreen(correo: correoGuardado,),
                              ),
                            )
                          );

                        
                      }
                    
                  } else {
                    Future.microtask(() => 
                      Navigator.of(context, rootNavigator: true).pushReplacement(
                        CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) => const IntroductionScreen(),
                        ),
                      )
                    );
                  }
                }

                return Container();
              },
            )
          
          );
        }
      )
      
   );
    
  }
}