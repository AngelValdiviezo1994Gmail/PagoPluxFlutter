import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pago_plux_test/src/models/index.dart';
import 'package:pago_plux_test/src/services/index.dart';
import 'package:intl/intl.dart';
import '../index.dart';

HistorialCobroResponse? objHistorialGlobal;

class HistorialCobroScreen extends StatelessWidget {

  static const String routerName = 'historialCobroScreen';

  const HistorialCobroScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(

      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false, 
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
              onPressed: () {
                Future.microtask(() => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => PrincipalScreen(correo: correoGen),
                      transitionDuration: const Duration(seconds: 0),
                    )
                  )
                );
              },
            ),
          ),
          body: FutureBuilder(
            future: PagoService().historialCobro("1792039010001","2023-08-01","2023-08-19","unico","pagado","1722530795"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: AutoSizeText(
                      '!UPS¡, intenta acceder después de unos minutos.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
            
                if (snapshot.hasData) {
                  HistorialCobroResponse  objHistorial = snapshot.data as HistorialCobroResponse;
                  objHistorialGlobal = objHistorial;
            
            
                  return Container(
                    width: size.width,
                    height: size.height,
                    child: HorizontalDataTable(
                      leftHandSideColumnWidth: 100,
                      rightHandSideColumnWidth: 600,
                      isFixedHeader: true,
                      headerWidgets: _getTitleWidget(),
                      isFixedFooter: true,
                      footerWidgets: _getTitleWidget(),
                      leftSideItemBuilder: _generateFirstColumnRow,
                      rightSideItemBuilder: _generateRightHandSideColumnRow,
                      itemCount: objHistorial.detail.transactionsData.length,
                      rowSeparatorWidget: const Divider(
                        color: Colors.black,
                        height: 1.0,
                        thickness: 0.0,
                      ),
                      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                      itemExtent: 55,
                    ),
                  );
                  
                }
              
                return Center(
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    color: Colors.transparent,
                    child: Image.asset('assets/loadingEnrolApp.gif'),
                  ),
                );
              }
          ),
        ),
      ),
    );

    
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Fecha Transaccion', 100),
      _getTitleItemWidget('Descripcion', 100),
      _getTitleItemWidget('Monto', 100),
      _getTitleItemWidget('# Identificación Cliente', 100),
      _getTitleItemWidget('Estado Transaccion', 100),
      _getTitleItemWidget('Tipo Pago', 100),
      _getTitleItemWidget('Marca Tarjeta', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String fechaRegistroFormateada = formatter.format(objHistorialGlobal!.detail.transactionsData[index].fechaTransaccion);

    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(fechaRegistroFormateada),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {

    return Row(
      children: <Widget>[

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].descripcion.name, maxLines: 2,),
          
        ),

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].monto, maxLines: 2,),
        ),

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].numeroIdentificacionCliente, maxLines: 2,),
        ),

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].estadoTransaccion.name, maxLines: 2,),
        ),

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].tipoPago.name, maxLines: 2,),
        ),

        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(objHistorialGlobal!.detail.transactionsData[index].marcaTarjeta.name, maxLines: 2,),
        ),
      ],
    );
  }


}
