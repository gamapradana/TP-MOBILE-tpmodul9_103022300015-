import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjumlahan_controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PenjumlahanController());

    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Penjumlahan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: c.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: c.angka1Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(signed: true),
                decoration: const InputDecoration(
                  labelText: 'Masukkan Angka Pertama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Angka pertama tidak boleh kosong';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'Masukkan bilangan bulat yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: c.angka2Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(signed: true),
                decoration: const InputDecoration(
                  labelText: 'Masukkan Angka Kedua',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Angka kedua tidak boleh kosong';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'Masukkan bilangan bulat yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              FilledButton.tonal(
                onPressed: c.hitung,
                child: const Text('Jumlahkan'),
              ),
              const SizedBox(height: 20),

              // Counter (reactive)
              Obx(() => Text(
                    'Jumlah Perhitungan: ${c.jumlahPerhitungan.value}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 12),

              // Hasil (reactive), bisa ditekan
              Obx(() {
                final d = c.data.value;
                return InkWell(
                  onTap: () => Get.to(() => const DetailPage()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      d == null
                          ? 'Belum ada data'
                          : 'Hasil: ${d.hasil} (Tekan untuk detail)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: d == null ? Colors.black87 : Colors.blue,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}