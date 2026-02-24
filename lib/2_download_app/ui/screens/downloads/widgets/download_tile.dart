import 'package:flutter/material.dart';
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  final DownloadController controller;

  const DownloadTile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.ressource.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    if (controller.status != DownloadStatus.notDownloaded)
                      const SizedBox(height: 6),

                    if (controller.status == DownloadStatus.downloading)
                      Text(
                        '${(controller.progress * 100).toInt()}% completed - '
                        '${(controller.ressource.size * controller.progress).toInt()} '
                        'of ${controller.ressource.size} MB',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),

                    if (controller.status == DownloadStatus.downloaded)
                      Text(
                        '100.0 % completed - ${controller.ressource.size} of '
                        '${controller.ressource.size} MB',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),

              _buildTrailing(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTrailing() {
    if (controller.status == DownloadStatus.notDownloaded) {
      return IconButton(
        icon: const Icon(Icons.download),
        onPressed: controller.startDownload,
      );
    }

    if (controller.status == DownloadStatus.downloading) {
      return const Icon(Icons.sync);
    }

    return const Icon(Icons.folder);
  }
}
