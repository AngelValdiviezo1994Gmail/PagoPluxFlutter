import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_plux_test/pago_plux_app.dart';
import '/src/bloc/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: ProviderScope(child: const PagoPluxApp())
    )
  );
}
