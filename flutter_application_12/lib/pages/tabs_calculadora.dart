import 'package:flutter/material.dart';
import 'package:flutter_application_12/providers/moneda_provider.dart';
//import 'package:loading_progress/loading_progress.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsCalcuradoraPage extends StatefulWidget {
  const TabsCalcuradoraPage({super.key});

  @override
  State<TabsCalcuradoraPage> createState() => _TabsCalcuradoraPageState();
}

class _TabsCalcuradoraPageState extends State<TabsCalcuradoraPage> {
  MonedasProvider monedas = MonedasProvider();

  String monedasSeleccionada = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Monto CPL',
                    hintText: 'Monto en peso Chileno',
                    suffixIcon: Icon(MdiIcons.cash),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );

    ///Center(
    ///child: Column(
    ///mainAxisAlignment: MainAxisAlignment.center,
    ///children: [
    ///ElevatedButton(
    /// onPressed: onTapStartbtn, child: const Text('Calculadora'))
    ///      ],
    ///    ));
    ///  }

    ///  onTapStartbtn() async {
    ///    LoadingProgress.start(
    ///      context,
    ///    );
    ///    await Future.delayed(const Duration(seconds: 2));
    ///    LoadingProgress.stop(context);
  }
}
