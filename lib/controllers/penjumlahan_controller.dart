import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/penjumlahan.dart';

class PenjumlahanController extends GetxController {
  final angka1Controller = TextEditingController();
  final angka2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final Rxn<Penjumlahan> data = Rxn<Penjumlahan>();
  final RxInt jumlahPerhitungan = 0.obs;

  void hitung() {
    if (!formKey.currentState!.validate()) return;

    final a = int.parse(angka1Controller.text.trim());
    final b = int.parse(angka2Controller.text.trim());
    final hasil = a + b;

    data.value = Penjumlahan(angka1: a, angka2: b, hasil: hasil);
    jumlahPerhitungan.value++;

    Get.snackbar(
      'Berhasil',
      'Proses penjumlahan berhasil dilakukan ($a + $b = $hasil)',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black87,
      margin: const EdgeInsets.all(12),
    );
  }

  @override
  void onClose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.onClose();
  }
}