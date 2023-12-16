import 'package:client/screens/absensi/karyawan.dart';
import 'package:flutter/material.dart';

class Absensi extends StatefulWidget {
  const Absensi({super.key});

  @override
  State<Absensi> createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: Text("Rekap Absensi"),
      ),
      body: EmployeeListView(employees: employees),
    );
  }
}

class EmployeeListView extends StatefulWidget {
  final List<Karyawan> employees;

  EmployeeListView({required this.employees});

  @override
  _EmployeeListViewState createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends State<EmployeeListView> {
  List<Karyawan> filteredEmployees = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEmployees = widget.employees;
    searchController.addListener(searchEmployees);
  }

  void searchEmployees() {
    String searchTerm = searchController.text.toLowerCase();
    filteredEmployees = widget.employees
        .where((employee) =>
            employee.id.toString().contains(searchTerm) ||
            employee.nama.toLowerCase().contains(searchTerm) ||
            employee.tanggal.toString().contains(searchTerm) ||
            employee.keterangan.toString().contains(searchTerm))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Filter berdasarkan ID, tanggal',
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Tanggal')),
              ],
              rows: filteredEmployees.map((employee) {
                return DataRow(cells: [
                  DataCell(Text(employee.id.toString())),
                  DataCell(Text(employee.nama)),
                  DataCell(Text(employee.tanggal.toString())),
                  DataCell(Text(employee.keterangan.toString())),
                ]);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
