import 'package:flutter/material.dart';
import 'service/color_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.tap_and_play), text: 'Taps'),
            Tab(icon: Icon(Icons.bar_chart), text: 'Statistics'),
          ],
        ),
        body: const TabBarView(
          children: [ColorTapsScreen(), StatisticsScreen()],
        ),
      ),
    );
  }
}


class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Column(
        children: const [
          ColorTap(type: CardType.red),
          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}


class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get bgColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (_, __) => GestureDetector(
        onTap: () => colorService.tap(type),
        child: Container(
          margin: const EdgeInsets.all(12),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Taps: ${colorService.getCount(type)}',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Center(
        child: ListenableBuilder(
          listenable: colorService,
          builder: (_, __) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _StatLine(type: CardType.red),
              _StatLine(type: CardType.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatLine extends StatelessWidget {
  final CardType type;

  const _StatLine({required this.type});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${type.name} taps: ${colorService.getCount(type)}',
      style: const TextStyle(fontSize: 24),
    );
  }
}
