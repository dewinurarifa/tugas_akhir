import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Widget? icon;
  final String value;
  const DetailCard({Key? key,this.icon,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        border: Border.all(color: Colors.black, width: 2),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon??SizedBox(),
              SizedBox(
                width: 20,
              ),
              Text(
                value,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
