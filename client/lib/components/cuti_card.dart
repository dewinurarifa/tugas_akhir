import 'dart:io';

import 'package:client/models/employee_model.dart';
import 'package:client/screens/cuti/details_cuti_screen.dart';
import 'package:flutter/material.dart';

class CutiCard extends StatelessWidget {
  final EmployeeModel employeeModel;
  final VoidCallback onDelete;
  const CutiCard(
      {Key? key, required this.employeeModel, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsCutiScreen(
                      employeeModel: employeeModel,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              foregroundImage: employeeModel.imgPath == null
                  ? const AssetImage("assets/images/profile-black.png")
                  : FileImage(File(employeeModel.imgPath!)) as ImageProvider,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 34,
                    child: Text(
                      "${employeeModel.id} : ${employeeModel.name}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
                const Divider(),
                Text(
                  employeeModel.position,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                GestureDetector(
                    onTap: onDelete,
                    child: const Icon(
                      Icons.delete_outline,
                      size: 30,
                      color: Colors.red,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
