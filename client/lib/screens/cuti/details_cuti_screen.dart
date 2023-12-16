import 'dart:io';

import 'package:client/components/detail_card.dart';
import 'package:client/data/employee_data.dart';
import 'package:client/models/employee_model.dart';
import 'package:flutter/material.dart';

import 'edit_cuti_screen.dart';
import 'home_cuti_screen.dart';

class DetailsCutiScreen extends StatefulWidget {
  final EmployeeModel employeeModel;
  const DetailsCutiScreen({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  State<DetailsCutiScreen> createState() => _DetailsCutiScreenState();
}

class _DetailsCutiScreenState extends State<DetailsCutiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "Employee Detail",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditCutiScreen(
                            employeeModel: widget.employeeModel)));
              },
              child: const Icon(
                Icons.edit,
                size: 30,
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                      image: widget.employeeModel.imgPath == null
                          ? AssetImage("assets/images/profile-black.png")
                          : FileImage(File(widget.employeeModel.imgPath!))
                              as ImageProvider,
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            DetailCard(
                icon: const Icon(
                  Icons.key,
                  color: Colors.white,
                ),
                value: widget.employeeModel.id.toString()),
            DetailCard(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                value: widget.employeeModel.name),
            DetailCard(
                icon: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                value: widget.employeeModel.position),
            DetailCard(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                value: widget.employeeModel.birthPlace),
            DetailCard(
                icon: const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                value: widget.employeeModel.birthDate),
            DetailCard(
                icon: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
                value: widget.employeeModel.leaveBalance.toString()),
            ElevatedButton(
              onPressed: () async {
                employeeList.removeWhere(
                    (element) => element.id == widget.employeeModel.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeCutiScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 50)),
              child: const Text(
                "HAPUS",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
