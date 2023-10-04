import 'package:flutter/material.dart';
import 'package:flutter_application_12/providers/moneda_provider.dart';
//import 'package:loading_progress/loading_progress.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';

class TabsCalcuradoraPage extends StatefulWidget {
  const TabsCalcuradoraPage({super.key});

  @override
  State<TabsCalcuradoraPage> createState() => _TabsCalcuradoraPageState();
}

class _TabsCalcuradoraPageState extends State<TabsCalcuradoraPage> {
  MonedasProvider monedas = MonedasProvider();

  String monedasSeleccionada = "UF";
  TextEditingController montoCtrl = TextEditingController();
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
                  controller: montoCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Monto CPL',
                    hintText: 'Monto en peso Chileno',
                    suffixIcon: Icon(MdiIcons.cash),
                  ),
                ),
              ),
              FutureBuilder(
                  future: monedas.getMonedas(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return (Center(
                        child: CircularProgressIndicator(),
                      ));
                    } else {
                      return Container(
                        child: DropdownButton<String>(
                          value: monedasSeleccionada,
                          onChanged: (value) {
                            setState(() {
                              monedasSeleccionada = value.toString();
                            });
                          },
                          hint: Text('Moneda Destino'),
                          items: snapshot.data
                              ?.map<DropdownMenuItem<String>>((monedas) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                  '(${monedas['Codigo']}) ${monedas['Nombre']}'),
                              value: monedas['Codigo'],
                            );
                          }).toList(),
                        ),
                      );
                    }
                  })
            ],
          )),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                int montoClp = int.parse(montoCtrl.value.text);
                double valorMonedaSeleccionada =
                    await monedas.getValorMonedas(monedasSeleccionada);
                double resultado =
                    roundDouble(montoClp / valorMonedaSeleccionada, 2);
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Resultado'),
                          content: Text('$resultado ($monedasSeleccionada)'),
                          actions: [
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ));
              },
              child: Text('Calcular'),
            ),
          )
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

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble());
  }
}
