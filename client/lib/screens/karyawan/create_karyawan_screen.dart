import 'package:client/screens/karyawan/data/employee_data.dart';
import 'package:client/screens/karyawan/models/employee_model.dart';
import 'package:flutter/material.dart';

class CreateKaryawanScreen extends StatefulWidget {
  const CreateKaryawanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateKaryawanScreen> createState() => _CreateKaryawanScreenState();
}

class _CreateKaryawanScreenState extends State<CreateKaryawanScreen> {
  TextEditingController idC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController positionC = TextEditingController();
  TextEditingController birthPlaceC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController backTitleC = TextEditingController();

  _validationForm() {
    if (nameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Nama tidak boleh kosong'),
      ));
    } else if (positionC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Jabatan tidak boleh kosong'),
      ));
    } else if (birthPlaceC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Tempat lahir tidak boleh kosong'),
      ));
    } else if (birthDateC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Tanggal lahir tidak boleh kosong'),
      ));
    } else if (titleC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Gelar depan tidak boleh kosong'),
      ));
    } else if (backTitleC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Gelar belakang tidak boleh kosong'),
      ));
    } else {
      _saveEmployee();
    }
  }

  _saveEmployee() async {
    var cekId =
        employeeList.indexWhere((element) => element.id.toString() == idC.text);
    print(cekId);
    if (cekId != -1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ID Sudah terdaftar'),
      ));
    } else {
      employeeList.add(EmployeeModel(
        id: employeeList.length + 1,
        name: nameC.text,
        position: positionC.text,
        birthPlace: birthPlaceC.text,
        birthDate: birthDateC.text,
        title: titleC.text,
        backTitle: backTitleC.text,
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Berhasil'),
      ));

      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tambah Karyawan",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/profile-black.png"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(200, 50)),
                child: const Text(
                  "PILIH FOTO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("NAMA"),
                    hintText: "Masukin Nama",
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: positionC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("JABATAN"),
                    hintText: "Masukin Jabatan",
                    suffixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: birthPlaceC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("TEMPAT LAHIR"),
                    hintText: "Masukin Tempat Lahir",
                    suffixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: birthDateC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("TANGGAL LAHIR"),
                    hintText: "Masukin Tanggal Lahir (yyyy/mm/dd)",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("GELAR DEPAN"),
                    hintText: "Masukin Gelar Depan",
                    suffixIcon: Icon(Icons.text_snippet),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: backTitleC,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("GELAR BELAKANG"),
                    hintText: "Masukin Gelar Belakang",
                    suffixIcon: Icon(Icons.text_snippet),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  _validationForm();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(200, 50)),
                child: const Text(
                  "SIMPAN",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
