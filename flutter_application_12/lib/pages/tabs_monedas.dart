import 'package:flutter/material.dart';
import 'package:flutter_application_12/providers/moneda_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsMonedasPage extends StatefulWidget {
  const TabsMonedasPage({super.key});
  @override
  State<TabsMonedasPage> createState() => _TabsMonedasPageState();
}

class _TabsMonedasPageState extends State<TabsMonedasPage> {
  MonedasProvider monedas = MonedasProvider();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            child: Text('Lista Monedas', style: TextStyle(fontSize: 23)),
          ),
          Expanded(
              child: FutureBuilder(
                  future: monedas.getMonedas(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) //Los datos NO LLEGARON
                    {
                      return Center(
                        child: Container(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Cargando.'),
                              LinearProgressIndicator()
                              //CircularProgressIndicator()
                            ],
                          ),
                        ),
                      );
                    } else {
                      //Leega respuesta
                      return ListView.separated(
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(MdiIcons.cash),
                            title: Text(snapshot.data[index]['Codigo']),
                            subtitle: Text(snapshot.data[index]['Nombre']),
                            trailing: Text(snapshot.data[index]['Valor']),
                          );
                        },
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
