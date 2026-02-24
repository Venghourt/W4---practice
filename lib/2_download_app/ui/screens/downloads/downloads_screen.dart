import 'package:flutter/material.dart';
import 'widgets/download_controler.dart';
import 'widgets/download_tile.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});

  final List<DownloadController> controllers = [
    DownloadController(Ressource(name: 'image1.png', size: 500)),
    DownloadController(Ressource(name: 'image2.png', size: 500)),
    DownloadController(Ressource(name: 'image3.png', size: 12000)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Downloads',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: const EdgeInsets.only(top: 16),
          children: controllers
              .map((c) => DownloadTile(controller: c))
              .toList(),
        ),
      ),
    );
  }
}
