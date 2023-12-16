import 'package:client/config/diohttp.dart';
import 'package:client/models/karyawan_model.dart';
import 'package:client/models/kontrak_model.dart';
import 'package:flutter/material.dart';

class EditKontrakScreen extends StatefulWidget {
  const EditKontrakScreen({required this.kontrak, super.key});
  final KontrakModel kontrak;
  @override
  State<EditKontrakScreen> createState() => _EditKontrakScreenState();
}

class _EditKontrakScreenState extends State<EditKontrakScreen> {
  late List<KaryawanModel> karyawans = [];
  late KaryawanModel _selectedEmployee = widget.kontrak.karyawan!;
  late final _awalKontrakController =
      TextEditingController(text: widget.kontrak.awalKontrak);
  late final _akhirKontrakController =
      TextEditingController(text: widget.kontrak.akhirKontrak);
  late final _totalJamKerjaController =
      TextEditingController(text: widget.kontrak.totalJamKerja.toString());
  late final _gajiPokokController =
      TextEditingController(text: widget.kontrak.gajiPokok.toString());

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

    await diohttp.post('/kontrak?method=PUT', data: kontrak.toJson());

    if (!mounted) {
      return;
    }
    Navigator.pushNamed(context, '/dashboard');
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
        title: const Text('Edit Kontrak'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (karyawans.isNotEmpty)
              DropdownButtonFormField<KaryawanModel>(
                decoration: const InputDecoration(labelText: 'Karyawan'),
                value: _selectedEmployee.id == null
                    ? null
                    : karyawans.firstWhere(
                        (element) => element.id == _selectedEmployee.id),
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
