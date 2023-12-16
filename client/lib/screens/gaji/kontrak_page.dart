import 'package:flutter/material.dart';

class KontrakPage extends StatefulWidget {
  const KontrakPage({super.key});

  @override
  State<KontrakPage> createState() => _KontrakPageState();
}

class _KontrakPageState extends State<KontrakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: Text("Kontrak Kerja"),
      ),
    );
  }
}
