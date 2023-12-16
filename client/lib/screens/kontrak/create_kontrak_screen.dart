import 'package:client/config/diohttp.dart';
import 'package:client/models/karyawan_model.dart';
import 'package:client/models/kontrak_model.dart';
import 'package:flutter/material.dart';

class CreateKontrakScreen extends StatefulWidget {
  const CreateKontrakScreen({super.key});
  @override
  State<CreateKontrakScreen> createState() => _CreateKontrakScreenState();
}

class _CreateKontrakScreenState extends State<CreateKontrakScreen> {
  List<KaryawanModel> karyawans = [];
  dynamic _selectedEmployee;
  final _awalKontrakController = TextEditingController();
  final _akhirKontrakController = TextEditingController();
  final _totalJamKerjaController = TextEditingController();
  final _gajiPokokController = TextEditingController();

  @override
  void initState() {
    super.initState();
    diohttp.get('/karyawan').then((value) {
      final data = value.data as List<dynamic>;
      final karyawan = data.map((e) => KaryawanModel.fromJson(e)).toList();
      setState(() {
        karyawans = karyawan;
      });
    });
  }

  void create() async {
    // check if all field is filled
    if (_selectedEmployee.id == null ||
        _awalKontrakController.text.isEmpty ||
        _akhirKontrakController.text.isEmpty ||
        _totalJamKerjaController.text.isEmpty ||
        _gajiPokokController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Karyawan harus diisi'),
        ),
      );
      return;
    }

    final kontrak = KontrakModel(
      idKaryawan: _selectedEmployee.id,
      awalKontrak: _awalKontrakController.text,
      akhirKontrak: _akhirKontrakController.text,
      totalJamKerja: int.parse(_totalJamKerjaController.text),
      gajiPokok: int.parse(_gajiPokokController.text),
    );

    await diohttp.post('/kontrak', data: kontrak.toJson());

    if (!mounted) {
      return;
    }
    Navigator.pushNamed(
      context,
      '/dashboard',
    );
  }

  void openAwalKontrakPicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      _awalKontrakController.text = date.toString();
    }
  }

  void openAkhirKontrakPicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      _akhirKontrakController.text = date.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Kontrak'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<KaryawanModel>(
              decoration: const InputDecoration(labelText: 'Karyawan'),
              items: karyawans.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.nama),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedEmployee = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _awalKontrakController,
              decoration: const InputDecoration(labelText: 'Awal Kontrak'),
              onTap: openAwalKontrakPicker,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _akhirKontrakController,
              decoration: const InputDecoration(labelText: 'Akhir Kontrak'),
              onTap: openAkhirKontrakPicker,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _totalJamKerjaController,
              decoration: const InputDecoration(labelText: 'Total Jam Kerja'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _gajiPokokController,
              decoration: const InputDecoration(labelText: 'Gaji Pokok'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: create,
              child: const Text(
                'Submit Contract',
                selectionColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
