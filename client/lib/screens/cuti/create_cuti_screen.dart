import 'dart:io';

import 'package:client/data/employee_data.dart';
import 'package:client/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateCutiScreen extends StatefulWidget {
  const CreateCutiScreen({super.key});

  @override
  State<CreateCutiScreen> createState() => _CreateCutiScreenState();
}

class _CreateCutiScreenState extends State<CreateCutiScreen> {
  TextEditingController idC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController positionC = TextEditingController();
  TextEditingController birthPlaceC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();
  TextEditingController leaveBalanceC = TextEditingController();
  File? imgFile;

  _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imgFile = File(image.path);
      });
    }
  }

  _validationForm() {
    if (idC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ID tidak boleh kosong'),
      ));
    } else if (nameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nama tidak boleh kosong'),
      ));
    } else if (positionC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Jabatan tidak boleh kosong'),
      ));
    } else if (birthPlaceC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Tempat lahir tidak boleh kosong'),
      ));
    } else if (birthDateC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Tanggal lahir tidak boleh kosong'),
      ));
    } else if (leaveBalanceC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Saldo cuti tidak boleh kosong'),
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
          id: int.parse(idC.text),
          name: nameC.text,
          position: positionC.text,
          birthPlace: birthPlaceC.text,
          birthDate: birthDateC.text,
          imgPath: imgFile == null ? null : imgFile!.path,
          leaveBalance: int.parse(leaveBalanceC.text)));
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
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "Employee Edit",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(
            children: [
              SizedBox(
                width: 150,
                height: 180,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              image: imgFile == null
                                  ? const AssetImage(
                                      "assets/images/profile-black.png")
                                  : FileImage(imgFile!) as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                        // child: imgFile == null ? Image.asset("assets/images/profile-black.png",
                        // fit: BoxFit.cover,) : Image.file(imgFile!,fit: BoxFit.cover,),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getImageFromGallery();
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.blueGrey,
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: idC,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("ID"),
                    hintText: "Masukin Id",
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder()),
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
                    prefixIcon: Icon(Icons.person),
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
                    prefixIcon: Icon(Icons.credit_card),
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
                    prefixIcon: Icon(Icons.location_on),
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
                    hintText: "Masukin Tanggal Lahir",
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: leaveBalanceC,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("SALDO CUTI"),
                    hintText: "Masukin saldo cuti",
                    prefixIcon: Icon(Icons.monetization_on),
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
                    backgroundColor: Colors.blueGrey,
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
