import 'package:flutter/material.dart';
import 'package:loading_progress/loading_progress.dart';

class TabsCalcuradoraPage extends StatefulWidget {
  const TabsCalcuradoraPage({super.key});

  @override
  State<TabsCalcuradoraPage> createState() => _TabsCalcuradoraPageState();
}

class _TabsCalcuradoraPageState extends State<TabsCalcuradoraPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: onTapStartbtn, child: const Text('Calculadora'))
      ],
    ));
  }

  onTapStartbtn() async {
    LoadingProgress.start(
      context,
    );
    await Future.delayed(const Duration(seconds: 2));
    LoadingProgress.stop(context);
  }
}
