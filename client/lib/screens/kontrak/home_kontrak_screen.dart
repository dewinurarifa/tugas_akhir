import 'package:client/config/diohttp.dart';
import 'package:client/models/kontrak_model.dart';
import 'package:client/screens/kontrak/create_kontrak_screen.dart';
import 'package:client/screens/kontrak/edit_kontrak_screen.dart';
import 'package:flutter/material.dart';

class HomeKontrakScreen extends StatefulWidget {
  const HomeKontrakScreen({super.key});

  @override
  State<HomeKontrakScreen> createState() => _HomeKontrakScreenState();
}

class _HomeKontrakScreenState extends State<HomeKontrakScreen> {
  List<KontrakModel> kontraks = [];

  void getKontraks() async {
    final response = await diohttp.get('/kontrak');
    final data = response.data as List<dynamic>;
    final kontrak = data.map((e) => KontrakModel.fromJson(e)).toList();
    if (mounted) {
      setState(() {
        kontraks = kontrak;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getKontraks();
  }

  void edit(KontrakModel kontrak) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditKontrakScreen(kontrak: kontrak),
    ));
  }

  void delete(int id) async {
    await diohttp.delete('/kontrak/$id');
    getKontraks();
  }

  void openKontrakDetailDialog(KontrakModel kontrak) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(kontrak.karyawan!.nama),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Awal Kontrak: ${kontrak.awalKontrak}'),
            Text('Akhir Kontrak: ${kontrak.akhirKontrak}'),
            Text('Total Jam Kerja: ${kontrak.totalJamKerja}'),
            Text('Gaji Pokok: ${kontrak.gajiPokok}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void openCreateKontrakScreen() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CreateKontrakScreen(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontrak Karyawan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: openCreateKontrakScreen,
          )
        ],
      ),
      body: ListView(
        children: [
          for (final kontrak in kontraks)
            ListTile(
              onTap: () => openKontrakDetailDialog(kontrak),
              title: Text(kontrak.karyawan!.nama),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Jam Kerja: ${kontrak.totalJamKerja}'),
                ],
              ),
              // Trailing as edit and delete
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colors.blue,
                    onPressed: () => edit(kontrak),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => delete(kontrak.id!),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
