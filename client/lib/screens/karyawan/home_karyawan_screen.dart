import 'package:client/components/employee_card.dart';
import 'package:client/screens/karyawan/create_karyawan_screen.dart';
import 'package:client/screens/karyawan/data/employee_data.dart';
import 'package:flutter/material.dart';

class HomeKaryawanScreen extends StatefulWidget {
  const HomeKaryawanScreen({super.key});

  @override
  State<HomeKaryawanScreen> createState() => _HomeKaryawanScreenState();
}

class _HomeKaryawanScreenState extends State<HomeKaryawanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Data Karyawan"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateKaryawanScreen()));
              },
              icon: Icon(Icons.add_box))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...employeeList.map((e) {
              return EmployeeCard(
                employee: e,
                onDelete: () {
                  setState(() {
                    employeeList.removeWhere((element) => element.id == e.id);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Berhasil hapus")));
                  });
                },
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
