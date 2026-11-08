import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjumlahan_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PenjumlahanController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Penjumlahan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                final d = c.data.value;

                if (d == null) {
                  return const Text('Belum ada data');
                }

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Angka Pertama : ${d.angka1}'),
                      const SizedBox(height: 6),
                      Text('Angka Kedua : ${d.angka2}'),
                      const Divider(height: 20),
                      Text(
                        'Hasil Penjumlahan : ${d.hasil}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () => Get.back(),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}