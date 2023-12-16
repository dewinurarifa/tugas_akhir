import 'package:client/components/cuti_card.dart';
import 'package:client/data/employee_data.dart';
import 'package:client/models/employee_model.dart';
import 'package:client/screens/cuti/create_cuti_screen.dart';
import 'package:flutter/material.dart';

class HomeCutiScreen extends StatefulWidget {
  const HomeCutiScreen({Key? key}) : super(key: key);

  @override
  State<HomeCutiScreen> createState() => _HomeCutiScreenState();
}

class _HomeCutiScreenState extends State<HomeCutiScreen> {
  List<EmployeeModel> _filterEmployee = [];
  TextEditingController cari = TextEditingController();

  List<EmployeeModel> _buildSearchList(String keyword) {
    List<EmployeeModel> _searchList = [];

    for (int i = 0; i < employeeList.length; i++) {
      String name = employeeList[i].name;
      int id = employeeList[i].id;
      String position = employeeList[i].position;

      if (id.toString().toLowerCase() == keyword.toLowerCase()) {
        _searchList.add(employeeList[i]);
      } else if (name.toLowerCase().contains(keyword.toLowerCase())) {
        _searchList.add(employeeList[i]);
      } else if (position.toLowerCase().contains(keyword.toLowerCase())) {
        _searchList.add(employeeList[i]);
      }
    }

    return _searchList;
  }

  @override
  void initState() {
    _filterEmployee = employeeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Data Cuti",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateCutiScreen()));
              },
              child: const Icon(
                Icons.add_box,
                size: 40,
                color: Colors.white,
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                  width: MediaQuery.of(context).size.width - 120,
                  child: TextField(
                    controller: cari,
                    decoration: InputDecoration(
                        label: Text("Cari"),
                        hintText: "ID, Nama atau jabatan ..",
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                cari.text = "";
                                _filterEmployee = _buildSearchList("");
                              });
                            },
                            child: Icon(Icons.close))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _filterEmployee = _buildSearchList(cari.text);
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _filterEmployee.isEmpty
                ? Center(
                    child: Text("Data Tidak ditemukan"),
                  )
                : Column(
                    children: [
                      ..._filterEmployee.reversed.map((e) {
                        return CutiCard(
                          employeeModel: e,
                          onDelete: () {
                            setState(() {
                              _filterEmployee
                                  .removeWhere((element) => element.id == e.id);
                            });
                          },
                        );
                      }).toList()
                    ],
                  ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
