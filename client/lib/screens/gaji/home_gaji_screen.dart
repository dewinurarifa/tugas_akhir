import 'package:client/screens/gaji/karyawan.dart';
import 'package:flutter/material.dart';

class HomeGajiScreen extends StatefulWidget {
  const HomeGajiScreen({super.key});

  @override
  State<HomeGajiScreen> createState() => _HomeGajiScreenState();
}

class _HomeGajiScreenState extends State<HomeGajiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: Text("Gaji"),
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
            employee.jabatan.toLowerCase().contains(searchTerm) ||
            employee.jamKerja.toString().contains(searchTerm) ||
            employee.gajiPerjam.toString().contains(searchTerm) ||
            employee.tunjangan.toString().contains(searchTerm))
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
              labelText: 'Filter berdasarkan ID, Nama, Jabatan',
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Jabatan')),
                DataColumn(label: Text('Jam Kerja')),
                DataColumn(label: Text('Gaji per Jam')),
                DataColumn(label: Text('Tunjangan')),
                DataColumn(label: Text('Total Gaji')),
              ],
              rows: filteredEmployees.map((employee) {
                employee.totalGaji = (employee.jamKerja * employee.gajiPerjam +
                    employee.tunjangan);
                return DataRow(cells: [
                  DataCell(Text(employee.id.toString())),
                  DataCell(Text(employee.nama)),
                  DataCell(Text(employee.jabatan)),
                  DataCell(Text(employee.jamKerja.toString())),
                  DataCell(Text(employee.gajiPerjam.toString())),
                  DataCell(Text(employee.tunjangan.toString())),
                  DataCell(
                    Text(employee.totalGaji.toStringAsFixed(2)),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
