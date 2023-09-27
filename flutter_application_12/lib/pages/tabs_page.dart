import 'package:flutter/material.dart';
import 'package:flutter_application_12/pages/tabs_calculadora.dart';
import 'package:flutter_application_12/pages/tabs_monedas.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsPageScreen extends StatefulWidget {
  const TabsPageScreen({super.key});

  @override
  State<TabsPageScreen> createState() => _TabsPageScreenState();
}

class _TabsPageScreenState extends State<TabsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Monedas App'),
          leading: Icon(MdiIcons.cashMultiple),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Monedas',
            ),
            Tab(
              text: 'Calculadora',
            )
          ]),
        ),
        body: TabBarView(
          children: [TabsMonedasPage(), TabsCalcuradoraPage()],
        ),
      ),
    );
  }
}
