import 'package:client/models/karyawan_model.dart';

class KontrakModel {
  int? id;
  int? idKaryawan;
  String awalKontrak;
  String akhirKontrak;
  int totalJamKerja;
  int gajiPokok;
  KaryawanModel? karyawan;

  KontrakModel({
    this.id,
    this.idKaryawan,
    required this.awalKontrak,
    required this.akhirKontrak,
    required this.totalJamKerja,
    required this.gajiPokok,
    this.karyawan,
  });

  factory KontrakModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final awalKontrak = json['awal_kontrak'];
    final akhirKontrak = json['akhir_kontrak'];
    final totalJamKerja = json['total_jam_kerja'];
    final gajiPokok = json['gaji_pokok'];
    final karyawan = json['karyawan'];

    return KontrakModel(
      id: id,
      awalKontrak: awalKontrak,
      akhirKontrak: akhirKontrak,
      totalJamKerja: totalJamKerja,
      gajiPokok: gajiPokok,
      karyawan: KaryawanModel.fromJson(karyawan),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_karyawan': idKaryawan,
      'awal_kontrak': awalKontrak,
      'akhir_kontrak': akhirKontrak,
      'total_jam_kerja': totalJamKerja,
      'gaji_pokok': gajiPokok,
    };
  }
}
