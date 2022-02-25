import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 = const TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número de clicks',
              style: fontSize30,
            ),
            Text(
              '$counter',
              style: fontSize30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFunc: increase,
        decreaseFunc: decrease,
        resetFunc: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFunc, decreaseFunc, resetFunc;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFunc,
    required this.decreaseFunc,
    required this.resetFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFunc(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => resetFunc(),
          child: const Icon(Icons.restart_alt_rounded),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFunc(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        )
      ],
    );
  }
}
